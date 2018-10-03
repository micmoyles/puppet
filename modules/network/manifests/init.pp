class network::base {

	}

class network::interfaces inherits network::base {
	file {'/etc/network/interfaces.d/runway':
		ensure => file,
		owner  => root,
		group  => root,
		mode   => 0644,
		content => template('network/interfaces.erb')
	}

}
class network::routes inherits network::base {
	file {'/usr/local/bin/configure-routing.sh':
		ensure => file,
		owner  => root,
		group  => root,
		mode   => 0644,
		source  => 'puppet:///modules/network/configure-network.sh';
}
}
