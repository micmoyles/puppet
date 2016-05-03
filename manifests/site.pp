import 'hello.pp'
import 'users'
import 'basefiles'
import 'directories'
import 'packages'
import 'boot'
import '::rabbitmq'

class users_and_groups {
	group { "svn" : ensure => present }
	group { "erova" : ensure => present }
	}

node 'raspberrypi.chello.ie' {
	include users::pi 
	include packages
	include users_and_groups
	include home_dirs
}
node 'knopfler.chello.ie' {
	include users_and_groups
	include workstation_packages 
}
node default {
	include packages
	include users_and_groups
	include home_dirs
	include users
}
