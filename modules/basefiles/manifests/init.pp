class basefiles {
		file { '/etc/test_bashrc':
		ensure => file,
		owner => root,
		group => root,
		mode  => 0755,
		source => 'puppet:///modules/basefiles/test_bashrc';
	}
		file { '/usr/local/bin/chelsea.sh':
		ensure => file,
		owner => root,
		group => root,
		mode  => 0755,
		source => 'puppet:///modules/basefiles/chelsea.sh';
	}
	}
