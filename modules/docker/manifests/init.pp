# class to install and configure docker
# 1) need to add dockers gpg key to the apt keyring
# 2) need to add dockers repo
# 3) install docker from repo

class docker {
	exec { 'Apt-get Update':
		    command => '/usr/bin/apt-get update',
    		path    => '/usr/local/bin/:/bin/:/usr/bin/',
        before  => package['docker-ce'];
	}
	exec {  'Get apt-key':
		    #command => 'curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /tmp/docker.gpg',
        command => 'curl -fsSL https://download.docker.com/linux/raspbian/gpg -o /tmp/docker.gpg',
    		path    => '/usr/local/bin/:/bin/:/usr/bin/',
        before  => Exec['Add apt-key'];
	}
  exec {  'Add apt-key':
		    command => 'apt-key add /tmp/docker.gpg',
    		path    => '/usr/local/bin/:/bin/:/usr/bin/',
        before  => Exec['Apt-get Update'];
	}

	file { '/etc/apt/sources.list.d/docker.list':
		ensure => file,
		owner => root,
		group => root,
		mode  => 0755,
		source => 'puppet:///modules/docker/docker.list',
    before => Exec['Get apt-key'];
	}

	package { "docker-ce": ensure => present,
          }
}
