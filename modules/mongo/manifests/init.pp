class mongo {
	exec { 'Apt-get Update':
		command => '/usr/bin/apt-get update',
    		path    => '/usr/local/bin/:/bin/:/usr/bin/',
	}
	exec {  'Add apt-key':
		command => '/usr/bin/apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6',
    		path    => '/usr/local/bin/:/bin/:/usr/bin/',
	}
	file { '/etc/apt/sources.list.d/mongodb-org-3.4.list':
		ensure => file,
		owner => root,
		group => root,
		mode  => 0755,
		source => 'puppet:///modules/mongo/mongo.list',
		require => Exec['Apt-get Update','Add apt-key'];
	}
	package { "mongodb-org": ensure => latest }
}
