class packages {
	exec {  'Add apt-key'
		command => '/usr/bin/apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6',
    		path    => '/usr/local/bin/:/bin/',
}
	file { '/etc/apt/sources.list.d/mongodb-org-3.4.list':
		ensure => file,
		owner => root,
		group => root,
		mode  => 0755,
		source => 'puppet:///modules/packages/mongo.list';
	}
	package { "mongodb-org": ensure => latest }
}
