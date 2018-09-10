# class to install and configure docker
# 1) need to add dockers gpg key to the apt keyring
# 2) need to add dockers repo
# 3) install docker from repo

class docker {
	exec { 'Apt-get Update':
		    command => '/usr/bin/apt-get update',
    		path    => '/usr/local/bin/:/bin/:/usr/bin/',
	}
	exec {  'Get apt-key':
		    command => 'curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /tmp/docker.gpg',
    		path    => '/usr/local/bin/:/bin/:/usr/bin/',
	}
  	exec {  'Add apt-key':
		    command => 'apt-key add /tmp/docker.gpg',
    		path    => '/usr/local/bin/:/bin/:/usr/bin/',
        require => Exec['Get apt-key'];

	}
	file { '/etc/apt/sources.list.d/docker.list':
		ensure => file,
		owner => root,
		group => root,
		mode  => 0755,
		source => 'puppet:///modules/docker/docker.list',
		require => Exec['Apt-get Update','Add apt-key'];
	}
	package { "docker-ce": ensure => latest }
}
