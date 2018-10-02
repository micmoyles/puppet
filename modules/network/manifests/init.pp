class network::base {
		file { '/etc/test_bashrc':
		ensure => file,
		owner => root,
		group => root,
		mode  => 0755,
		source => 'puppet:///modules/basefiles/test_bashrc';
	}
	}

class network::interfaces inherits network {
	file {'/etc/network/interfaces.d/runway':
		ensure => file,
		owner  => root,
		group  => root,
		mode   => 0644,
		content => template('network/interfaces.erb')
	}

}
