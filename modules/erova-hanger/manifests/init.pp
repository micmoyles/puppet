# == Class: hanger
#
#  This will install the database and configure the front end webserver and script used to access it. 
#
#
$remit_directories = ['/data','/data/REMIT','/data/REMIT/archive','/data/REMIT/transmit']
$hanger_directories = ['/var/www/hanger/']
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
# Author Name <mike@erova-it.ie>
#
# === Copyright
#
# Copyright 2016 Michael Moyles
#
class hanger {
# this module needs work, the symlinks should be created - not added to a bash file
	package { "mysql-server": ensure => present }
	package { "python-bs4": ensure => present }
	package { "python-dev": ensure => present }
	package { "python2.7-mysqldb": ensure => present }
	package { "libmysqlclient-dev": ensure => present }
	package { "postgresql": ensure => present }
	package { "postgresql-contrib": ensure => present }
	file { "erova packages directory":
		path => '/home/erova/packages',
		ensure => directory,
		mode => 0755,
		owner => erova,
		group => erova
}
	file { "erova python packages directory":
		path => '/home/erova/packages/python',
		ensure => directory,
		mode => 0755,
		owner => erova,
		group => erova
}
        file { "stomp files":
		require => File['/home/erova/packages/python'],
		path => '/home/erova/packages/python/stomp',
		source => 'puppet:///modules/erova-hanger/stomp/',
		recurse => true,
 }
        file { "database configuration script ":
		path => '/usr/local/bin/setup_mysqldbs.sh',
		source => 'puppet:///modules/erova-hanger/setup_mysqldbs.sh',
		mode => 0755,
		owner => root,
		group => root
 }
	exec { "Run database config script":
		require => File['/usr/local/bin/setup_mysqldbs.sh'],
		command => '/usr/local/bin/setup_mysqldbs.sh'
}
	file { $remit_directories:
		ensure => directory,
		owner => erova,
		group => erova,
		mode => 0755		
	}
	file { $hanger_directories:
		  ensure => directory,
		  owner  => root,
		  group  => root,
		  mode   => 0777
	}
	file { 'apache site configs':
	 		path => '/etc/apache2/sites-available/001-hanger',
	 		sourec => 'puppet:///modules/erova-hanger/apache2/001-hanger',
	 		owner => root,
	 		group => root,
	 		mode => 0777
	 }
}
