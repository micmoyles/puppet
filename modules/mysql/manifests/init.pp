# == Class: mysql
#
#  This will install the database and configure the front end webserver and script used to access it. 
#
#
$remit_directories = ['/data','/data/REMIT','/data/REMIT/archive','/data/REMIT/transmit','/data/REMIT/plant_data','/data/REMIT/error','/data/REMIT/dupes']
$app_directories = ['/data/apps','/data/monit']
$hanger_directories = ['/var/www/hanger/','/var/www/hanger/plant_data/']
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'hanger':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <micmoyles@gmail.com>
#
# === Copyright
#
# Copyright 2018 Michael Moyles
#
class mysql::base {
	package { "mysql-server": ensure => present }
	package { "libmysqlclient-dev": ensure => present }
	
}
class mysql::config inherits mysql::base {	
	file { "database configuration script ":
		path => '/usr/local/bin/setup_mysqldbs.sh',
		source => 'puppet:///modules/mysql/setup_mysqldbs.sh',
		mode => 0755,
		owner => root,
		group => root
 }
	file { "database configuration script 2 - temporary lets remember to tidy this all up":
		path => '/usr/local/bin/setup_mysqldbs2.sh',
		source => 'puppet:///modules/mysql/setup_mysqldbs2.sh',
		mode => 0755,
		owner => root,
		group => root
 }
	file { "database configuration commands - temporary lets remember to tidy this all up":
		path => '/tmp/commands.sql',
		source => 'puppet:///modules/mysql/commands.sql',
		mode => 0755,
		owner => root,
		group => root
 }
	exec { "Run database config script":
		require => File['/usr/local/bin/setup_mysqldbs.sh'],
		command => '/usr/local/bin/setup_mysqldbs.sh'
}
	exec { "Run second database config script":
		require => File['/usr/local/bin/setup_mysqldbs2.sh'],
		require => File['/tmp/commands.sql'],
		command => '/usr/local/bin/setup_mysqldbs2.sh'
}	
} # close config
