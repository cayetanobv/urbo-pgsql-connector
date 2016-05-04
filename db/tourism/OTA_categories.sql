

--
--Open Travel Alliance Categories TABLE
--
BEGIN;

CREATE TABLE public.ota_categories
(
  codes character varying(255),
  types jsonb
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.ota_categories
  OWNER TO fiware_admin;


INSERT INTO public.ota_categories
SELECT * FROM json_to_recordset('[{"code":"Cultural","types":["Archeology","Architecture","Art","Jazz","Museums","Theater","Concert","Cultural","Historical","Music","Photography","Sightseeing"]},{"code":"EcoAdventure","types":["Agriculture","Ecology","Garden","Farmstays","Guided_Land","Submersible_Scooter"]},{"code":"Educational","types":["Educational","Astronomy","Spiritual","Holistic","Research"]},{"code":"GuidedTour","types":["Cave_Tours","Combination_Tours","Underwater_Reef_Tours","Sunrise_Tours","Segway_Tours"]},{"code":"Nature","types":["Bird_watching","Amphibious","Aquariums","Camping","Whale_Watching","Volcano","Turtle_Watching","Dolphins","Hiking","Manta_Ray_Snorkel","Nature","Parks","Rainforest","Safari","Scuba/Snorkeling"]},{"code":"SportsAndRecreation","types":["Banana_Boat","Bicycling","Boogie_Boarding","Bumper_Tubing","Canoeing","Canyoneering","Climbing","Cross_Country","Diving","Equestrian","Fishing","Golf","Golf_Golf_Courses","Hang_Gliding","Hiking","Horseback","Hula_Dancing","Jet_Skiing","Kayaking","Marathon","Motorcycling","Mountaineering","Paragliding","Parasailing","Pilgrimage","Scuba/Snorkeling","Skate_Park","Skiing","Snowboarding","Snowmobile","Spa_and_Gym","Speed_Boating","Sphere_Riding","Sport_Fishing","Sporting_Clays","StandUp_Paddle_Boarding","Train","Trekking","Underwater_Reef_Tours","Wakeboarding","Walking","Water_Skiing","Windsurfing"]},{"code":"FoodAndBeverage","types":["Restaurants","Food","Gourmet","Guided_Restaurant","Wine","Culinary","Restaurant_Tours"]},{"code":"Free","types":["Free"]},{"code":"Adventure","types":["Adventure","Ballooning","All_Terrain_Vehicle","Bumper_Tubing","Canyoneering","Climbing","Hang_Gliding","Helicopter","War","Submarine","Storm_Chasing","Space","Dog_Sledding","Flightseeing","GlassBottom_Viewing","High_Performance_Jet_Boat","Jet_Skiing","Lava_Tour","Rafting"]},{"code":"Theater","types":["Theater"]},{"code":"Walking","types":["Walking","Trekking"]},{"code":"Historical","types":["Historical"]},{"code":"Museums","types":["Museums"]},{"code":"Show","types":["Show"]},{"code":"Golf","types":["Golf","Golf_Golf_Courses"]},{"code":"Accessible","types":["Disabled"]},{"code":"EscortedTour","types":["Island_Day_Trip"]},{"code":"Family","types":["Attractions","Homestays","Water_Park","Zoo","Youth_Activities","Vacation_Portraits"]},{"code":"Group","types":["Surfing_Camps","Comedy_Club","Luau","Mancation","Meetings"]},{"code":"Independent","types":["Single"]},{"code":"Romantic","types":["Weddings","Sunset_Dinner","Honeymoon","Spa_and_Gym"]},{"code":"Beach","types":["Beach","Boating/Boat_Tour","Boogie_Boarding","Yacht_Charters"]},{"code":"MotorSports","types":["Motorcycling"]},{"code":"WaterSports","types":["Wakeboarding","Bareboat","Canoeing","Windsurfing","Water_Skiing","Speed_Boating","StandUp_Paddle_Boarding","Kayaking","Sailing"]},{"code":"SnowSports","types":["Skiing","Snowboarding","Snowmobile"]},{"code":"WheeledSports","types":["Bicycling","Skate_Park"]},{"code":"Fishing","types":["Sport_Fishing","Fishing"]},{"code":"OtherSports","types":["Sporting_Clays"]},{"code":"MountainSports","types":["Mountaineering"]},{"code":"AirSports","types":["Paragliding","Parasailing"]},{"code":"Underwater","types":["Snuba","Diving","Scuba_Lessons"]},{"code":"OnAnimals","types":["Equestrian","Horseback"]},{"code":"OnFoot","types":["Marathon","Cross_Country"]},{"code":"Travelling","types":["Airline_Airplane","Barges","Train","Transportation","Ferries","Freighters","Cruise","Inter_Island_Transportation","Motorcoach","Pilgrimage","Railroad_or_Trams"]},{"code":"Other_","types":["Audio","Clothing_Optional","Shopping","Volunteering","Dude_Ranch","Eclipse","Free","Ghost","Executive_Board","Lei_Greeters","Night_Life","Religious","Rental_Equipment","Show","Other_"]}]')
  as x(code text, types jsonb);

COMMIT;
