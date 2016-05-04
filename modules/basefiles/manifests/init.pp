class basefiles {
		file { '/usr/local/bin/chelsea.sh':
		ensure => file,
		owner => root,
		group => root,
		mode  => 0755,
		source => 'puppet:///modules/basefiles/chelsea.sh';
	}
		file { '/etc/test_bashrc':
		ensure => file,
		owner => root,
		group => root,
		mode  => 0755,
		source => 'puppet:///modules/basefiles/test_bashrc';
	}
		file { '/etc/vim/vimrc.local':
		ensure => file,
		owner => root,
		group => root,
		mode  => 0755,
		source => 'puppet:///modules/basefiles/vimrc.local';
	}
	}

class basefiles::workstation inherits basefiles {
		file { '/usr/local/bin/chelsea2.sh':
		ensure => file,
		owner => root,
		group => root,
		mode  => 0755,
		source => 'puppet:///modules/basefiles/chelsea.sh';
	}
}
