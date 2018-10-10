import 'hello.pp'
import 'users'
import 'basefiles'
import 'packages'
import 'mongo'
import 'bootstrapping'
import 'runway'
import 'docker'
import 'nodes/*.pp'

class users_and_groups {
	group { "svn" : ensure => present }
	group { "erova" : ensure => present }
	}

node 'raspberrypi.chello.ie' {
	include users::pi 
	include packages::server
	include users_and_groups
	include directories::home::pi
	include boot
}
node 'puppet' {
	include packages::erova
  include packages::server
	include runway
	include users::puppet
	include boot
  include basefiles
  include docker
  include network::interfaces
}
node 'michael-S500CA'{
	include packages::workstation
	include boot
}
node default {
	include users
	include users_and_groups
	include basefiles
	include boot
}
