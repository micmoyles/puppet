flush privileges
create database if not exists REMIT
create database if not exists config
create database if not exists trades
create database if not exists position
create user if not exists 'erova'@'localhost' identified by 'er0va123'
create user if not exists 'reader'@'%' identified by '1canR3ad'
grant select on REMIT.* to 'reader'@'%'
grant select on config.* to 'reader'@'%'
grant select on trades.* to 'reader'@'%'
grant select on position.* to 'reader'@'%'
grant select,insert,update on REMIT.* to 'erova'@'localhost'
grant select,insert,update on config.* to 'erova'@'localhost'
create table if not exists REMIT.frequency ( timestamp timestamp, freq float(10,5) )
create table if not exists REMIT.SOSO ( pubTs timestamp, PT float(10,5) , TD varchar(3), IC varchar(30), ST timestamp, TT varchar(30), TQ int(100) ,unique(pubTs) )
create table if not exists REMIT.outages (messageCreationTs timestamp, AffectedUnitEIC varchar(30), AssetType varchar(30), AffectedUnit varchar(30), DurationUncertainty varchar(30), RelatedInformation varchar(200), AssetId varchar(30), EventType varchar(30), NormalCapacity float(10,5), AvailableCapacity float(10,5), EventStatus varchar(30), EventStart timestamp, EventEnd timestamp, Cause varchar(30), FuelType varchar(30), Participant_MarketParticipantID varchar(30), MessageHeading varchar(30) )
create table if not exists config.plants ( name varchar(30), AssetID varchar(30), FuelType varchar(30), NormalCapacity float(10,5), plantID int not null auto_increment, primary key (plantID) )
create table if not exists trades.trades ( Instrument varchar(30),
                                                        InstrumentBegin timestamp ,
                                                        InstrumentEnd timestamp,
                                                        Segment varchar(30),
                                                        Market varchar(5),
                                                        Side varchar(1),
                                                        Quantity float(6,3),
                                                        Price float(6,3),
                                                        PriceUnit varchar(5),
                                                        Trader varchar(2),
                                                        Counterparty varchar(10),
                                                        TradeDate timestamp,
                                                        TradeID int not null auto_increment,
                                                        primary key (TradeID) ) 
create table if not exists position.irl ( timestamp timestamp, position float(10,5) )
create table if not exists position.uk ( timestamp timestamp, position float(10,5) )
create table if not exists position.nl ( timestamp timestamp, position float(10,5) )
alter table config.plants add constraint unique(AssetID)
alter table position.irl add constraint unique(timestamp)
alter table position.uk add constraint unique(timestamp)
alter table position.nl add constraint unique(timestamp)
create table if not exists config.plant_status ( AssetID varchar(30), Status varchar(30), NormalCapacity float(10,5), CurrentCapacity float(10,5))
alter table config.plant_status add constraint unique(AssetID)
