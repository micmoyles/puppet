import 'hello.pp'
import 'users'
import 'basefiles'
import 'directories'
import 'packages'
import 'erova-boot'

class users_and_groups {
	group { "svn" : ensure => present }
	group { "erova" : ensure => present }
	}

node 'raspberrypi.chello.ie' {
	include users::pi 
	include packages
	include users_and_groups
	include directories::home::pi
}
node 'knopfler.chello.ie' {
	include users_and_groups
	include workstation_packages 
}
node default {
	include users
	include users_and_groups
	include packages
	include directories::home
	include basefiles
	include boot
}
