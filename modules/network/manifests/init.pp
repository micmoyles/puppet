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
