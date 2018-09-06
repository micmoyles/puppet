import 'hello.pp'
import 'users'
import 'basefiles'
import 'packages'
import 'mongo'
import 'erova-boot'
import 'runway'

class users_and_groups {
	group { "svn" : ensure => present }
	group { "erova" : ensure => present }
	}

node 'raspberrypi.chello.ie' {
	include users::pi 
	include server_packages
	include users_and_groups
	include directories::home::pi
	include boot
}
node 'puppet' {
	include erova_packages
	include packages
	include runway 
	include users::erova
}
node 'michael-S500CA'{
	include workstation_packages
}
node default {
	include users
	include users_and_groups
	include basefiles
	include boot
}
