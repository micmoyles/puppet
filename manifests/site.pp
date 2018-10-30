import 'hello.pp'
import 'users'
import 'basefiles'
import 'packages'
import 'mongo'
import 'bootstrapping'
import 'runway'
import 'docker'
import 'nodes/*.pp'


node 'puppet' {
  	include packages::server
	include runway
	include users::puppet
	include boot
	include basefiles
  	include docker
  	include network::interfaces
}
node 'mmoyles-workstation-1' {
	include packages::workstation
	include boot::base
	include docker
}
node default {
	include boot::identify
}
