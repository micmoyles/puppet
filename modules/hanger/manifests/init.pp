# == Class: hanger
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
# Copyright 2016 Michael Moyles
#
class hanger::base {
# this module needs work, the symlinks should be created - not added to a bash file
	service { "apache2": ensure => running }
	package { "mysql-server": ensure => present }
	package { "python-bs4": ensure => present }
	package { "python-dev": ensure => present }
	package { "python2.7-mysqldb": ensure => present }
	package { "libmysqlclient-dev": ensure => present }
	package { "postgresql": ensure => present }
	package { "postgresql-contrib": ensure => present }
	
	file { "user packages directory":
		path => '/usr/local/packages',
		ensure => directory,
		mode => 0755,
		owner => root,
		group => root
}
	file { "python packages directory":
		path => '/usr/local/packages/python',
		ensure => directory,
		mode => 0755,
		owner => root,
		group => root
}
	file { "stomp files":
		require => File['/usr/local/packages/python'],
		path => '/usr/local/packages/python/stomp',
		source => 'puppet:///modules/hanger/stomp/',
		recurse => true,
 }
	file { "database configuration script ":
		path => '/usr/local/bin/setup_mysqldbs.sh',
		source => 'puppet:///modules/hanger/setup_mysqldbs.sh',
		mode => 0755,
		owner => root,
		group => root
 }
	file { "database configuration script 2 - temporary lets remember to tidy this all up":
		path => '/usr/local/bin/setup_mysqldbs2.sh',
		source => 'puppet:///modules/hanger/setup_mysqldbs2.sh',
		mode => 0755,
		owner => root,
		group => root
 }
	file { "database configuration commands - temporary lets remember to tidy this all up":
		path => '/tmp/commands.sql',
		source => 'puppet:///modules/hanger/commands.sql',
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
	file { $remit_directories:
		ensure => directory,
		owner => erova,
		group => erova,
		mode => 0775		
	}
	file { $app_directories:
		ensure => directory,
		owner => erova,
		group => erova,
		mode => 0775		
	}
	file { $hanger_directories:
		  ensure => directory,
		  owner  => root,
		  group  => erova,
		  mode   => 0775
	}
	file { 'apache site configs':
	 	path => '/etc/apache2/sites-available/001-hanger.conf',
	 	source => 'puppet:///modules/hanger/apache2/001-hanger',
	 	owner => root,
	 	group => root,
	 	mode => 0777
	 }
	file { 'Enable 001-hanger':
		notify => service['apache2'],
	 	path => '/etc/apache2/sites-enabled/001-hanger.conf',
	 	source => 'puppet:///modules/hanger/apache2/001-hanger',
	 	owner => root,
	 	group => root,
	 	mode => 0777
	 }
	file { 'htpasswd access file':
	 	path => '/etc/apache2/.htpasswd',
	 	source => 'puppet:///modules/hanger/apache2/htpasswd',
	 	owner => root,
	 	group => root,
	 	mode => 0777
	 }
}
