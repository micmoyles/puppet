import 'hello.pp'
import 'users'
import 'basefiles'
import 'packages'
import 'mongo'
import 'bootstrapping'
import 'runway'
import 'docker'
import 'nodes/*.pp'

node 'raspberrypi.chello.ie' {
	include users::pi 
	include packages::server
	include users_and_groups
	include directories::home::pi
	include boot
}
node 'puppet' {
  	include packages::server
	include runway
	include users::puppet
	include boot
	include basefiles
  	include docker
  	include network::interfaces
}
node 'michael-S500CA' {
	include packages::workstation
	include boot::base
}
node default {
	include boot::identify
}
