'use strict';

var request = require('request');
var _request = require('supertest');
var should = require('chai').should();  // actually call the function
var config = require('../config');
var subscriptions = require('../orion/subscriptions');
var http = require('http');
var SQL = require('../models/pgsqlmodel');
var app = require('../app').app;
var subscriptions = require('../app').subscriptions;

var srv = config.getSubService('lighting_simulations');
var headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Fiware-Service': srv.service,
  'Fiware-ServicePath': srv.subservice
};

var requestBody = {
 updateAction: 'APPEND',
 contextElements:
 [
  {
    "type":"ht_6",
    "isPattern":"false",
    "id":"sepulveda-01",
    "attributes":[
       {
          "name":"energyConsumed",
          "type":"Number",
          "value":"0",
          "metadatas":[
             {
                "name":"TimeInstant",
                "type":"DateTime",
                "value":"2017-01-17T11:30:30.828Z"
             },
             {
                "name":"dateUpdated",
                "type":"DateTime",
                "value":"2017-01-17T11:30:30.828Z"
             },
             {
                "name":"uom",
                "type":"Text",
                "value":"kVArh"
             }
          ]
       },
       {
          "name":"reactiveEnergyConsumed",
          "type":"Number",
          "value":"0",
          "metadatas":[
             {
                "name":"TimeInstant",
                "type":"DateTime",
                "value":"2017-01-17T11:30:30.837Z"
             },
             {
                "name":"dateUpdated",
                "type":"DateTime",
                "value":"2017-01-17T11:30:30.837Z"
             },
             {
                "name":"uom",
                "type":"Text",
                "value":"kVArh"
             }
          ]
       },
       {
          "name":"timeInstant",
          "type":"DateTime",
          "value":"2017-01-17T11:30:30.876Z"
       },
       {
          "name":"totalActivePower",
          "type":"Number",
          "value":"0",
          "metadatas":[
             {
                "name":"TimeInstant",
                "type":"DateTime",
                "value":"2017-01-17T11:30:30.818Z"
             },
             {
                "name":"dateUpdated",
                "type":"DateTime",
                "value":"2017-01-17T11:30:30.818Z"
             }
          ]
       }
    ]
  }
]
}

var reku = {
  headers: headers,
  url: config.getCtxBrUrls('update'),
  method: 'POST',
  json: requestBody

}

var testAPI = {
  url: 'http://urbo_connector:3000/subscriptions/lighting_stcabinet_state',
  method: 'POST',
  json: {}
}

describe('ORION', function(){

  var url = 'http://localhost:3000';
  var server;

  before(function(){
    this.timeout(0);
    server = app.listen(3000, function(s){
      console.log("Listening...");
    });
  });

  after(function(){
    server.close();
  });

  it('Dummy headers check', function(done){
    headers['Content-Type'].should.be.equal('application/json');
    headers['Fiware-Service'].should.be.equal('urbo');
    headers['Fiware-ServicePath'].should.be.equal('/geographica_dev');
    done();
  });

  it('Initialize subscriptions', function(done){
    this.timeout(0);

    _request(url)
    .get('/')
    .expect(200)
    .expect('Content-Type', /json/)
    .expect(function(res){
      res.text.should.be.equal('"URBO - PGSQL Connector"');

      subscriptions.initialize(function(error, data){
        should.equal(error, null);
        request(reku, function(error, response, body){
          should.equal(error, null);
          body.contextResponses[0].statusCode.code.should.be.equal('200');
          request(testAPI, function(error, response, body){
            should.equal(error, null);
            var sql = new SQL(config.getData().pgsql);
            var query = "SELECT COUNT(*) from distrito_telefonica.lighting_stcabinet_state";
            sql.query(query, null, function(error, data){
              should.equal(error, null);
              should.equal(data.rowCount, 1);
              done();
            });
          })

        });
      });
    })
    .end(function(req, res){});

  });


});
