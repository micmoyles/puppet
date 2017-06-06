import 'hello.pp'
import 'users'
import 'basefiles'
import 'packages'
import 'mongo'
import 'erova-boot'
import 'erova-hanger'

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
node 'ip-172-31-45-132' {
	include users_and_groups
	include erova_packages
	include hanger
	include boot 
}
node default {
	include users
	include users::erova
	include users_and_groups
	include erova_packages
	include packages
	include hanger 
	include basefiles
	include boot
}
