#!/bin/bash

# script to setup databases amd users

mysql -uroot -e 'flush privileges'
mysql -uroot -e 'create database if not exists REMIT'
mysql -uroot -e 'create database if not exists config'
mysql -uroot -e "create user 'erova'@'localhost' identified by 'er0va123'"
mysql -uroot -e "grant select,insert,update on REMIT.* to 'erova'@'localhost'"
mysql -uroot -e "grant select,insert,update on config.* to 'erova'@'localhost'"
