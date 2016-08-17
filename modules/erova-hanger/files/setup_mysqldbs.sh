#!/bin/bash

# script to setup databases amd users

mysql -uroot -e 'flush privileges'
mysql -uroot -e 'create database if not exists REMIT'
mysql -uroot -e 'create database if not exists config'
mysql -uroot -e "create user if not exists 'erova'@'localhost' identified by 'er0va123'"
mysql -uroot -e "grant select,insert,update on REMIT.* to 'erova'@'localhost'"
mysql -uroot -e "grant select,insert,update on config.* to 'erova'@'localhost'"
mysql -uroot -e "create table if not exists REMIT.frequency ( timestamp timestamp, freq float(10,5) )"
mysql -uroot -e "create table if not exists REMIT.SOSO ( pubTs timestamp, PT float(10,5) , TD varchar(3), IC varchar(30), ST timestamp, TT varchar(30), TQ int(100) ,unique(pubTs) )"
mysql -uroot -e "create table if not exists REMIT.outages (messageCreationTs timestamp, AffectedUnitEIC varchar(30), AssetType varchar(30), AffectedUnit varchar(30), DurationUncertainty varchar(30), RelatedInformation varchar(200), AssetId varchar(30), EventType varchar(30), NormalCapacity float(10,5), AvailableCapacity float(10,5), EventStatus varchar(30), EventStart timestamp, EventEnd timestamp, Cause varchar(30), FuelType varchar(30), Participant_MarketParticipantID varchar(30), MessageHeading varchar(30) )"
mysql -uroot -e "create table if not exists config.plants ( name varchar(30), AssetID varchar(30), FuelType varchar(30), NormalCapacity float(10,5), plantID int not null auto_increment, primary key (plantID) )"
mysql -uroot -e " alter table config.plants add constraint unique(AssetID)"
mysql -uroot -e " create table if not exists config.plant_status ( AssetID varchar(30), Status varchar(30), NormalCapacity float(10,5), CurrentCapacity float(10,5));"
mysql -uroot -e " alter table config.plant_status add constraint unique(AssetID)"
