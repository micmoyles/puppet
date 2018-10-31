import 'hello.pp'
import 'users'
import 'basefiles'
import 'packages'
import 'mongo'
import 'bootstrapping'
import 'runway'
import 'docker'
import 'hanger'
import 'nodes/*.pp'


node 'puppet' {
  	include packages::server
	include users::puppet
	include boot::base
	include basefiles
  	include network::interfaces
  	include runway
  	include docker
  	include hanger::base
}
node 'mmoyles-workstation-1' {
	include packages::workstation
	include boot::base
	include docker
}
node default {
	include boot::identify
}
