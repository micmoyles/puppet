import 'hello.pp'
import 'users'
import 'basefiles'
import 'directories'
import 'packages'
import 'erova-boot'
import 'erova-hanger'
#test comment

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
node 'knopfler.chello.ie' {
	include users_and_groups
	include workstation_packages 
	include hanger
}
node default {
	include users
	include users_and_groups
	include packages
	include directories::home
	include basefiles
	include boot
}
