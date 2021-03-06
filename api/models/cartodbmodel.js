var CartoDB = require('cartodb');

var utils = require('./utils');

var logParams = require('../config.js').getLogOpt();
var log = require('log4js').getLogger(logParams.output);

function CartoDBModel(cfg){
  this._user = cfg.user;
  this._apiKey = cfg.apiKey;
  this._enterprise = cfg.enterprise;
  this._sql = new CartoDB.SQL({user: cfg.user,api_key: cfg.apiKey, sql_api_url: 'https://'+ cfg.user+ '.carto.com/api/v2/sql'});
  this._squel = require('squel');
};

CartoDBModel.prototype.query = function(opts,cb){
  var err = null;
  if (!opts)
    err = "No params";
  else if (!opts.query)
    err = "No query";

  opts.params = opts.params || {};

  if (err){
    log.error(err);
    cb(err);

  } else{
    this._sql.execute(opts.query, opts.params)
      .done(function(data){
        if (cb) cb(null,data);
      })
      .error(function(err){
        log.error(err);
        log.error(valueTemplate(opts.query, opts.params));
        if (cb) cb(err);
      });
  }
}

CartoDBModel.prototype.insert = function(table,data,dontquotedata,cb){

  var constructor = this._squel.insert().into(table);

  for (var i in data){
    constructor.set(utils.wrapStrings(i,['"']),data[i]);
  }

  for (var i in dontquotedata){
    constructor.set(utils.wrapStrings(i,['"']),dontquotedata[i],{dontQuote: true});
  }

  var sql = constructor.toString();
  this.query({query: sql},cb);

}

function valueTemplate(s,d){
  for(var p in d) s = s.replace(new RegExp('{'+p+'}', 'g'), d[p]);
  return s;
};


module.exports = CartoDBModel;
