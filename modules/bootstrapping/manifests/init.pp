# == Class: boot
#
# Full description of class boot here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'boot':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <micmoyles@gmail.com>
#
# === Copyright
#
# Copyright 2016 Michael Moyles, unless otherwise noted.
#

class boot::identify {
	file { '/etc/node_puppet_conf':
    owner   => root,
    group   => root,
    mode    => 0755,
    content => template("bootstrapping/node_puppet_conf.erb")
  }
}
class boot::base inherits boot::identify {
	file{'/etc/motd':
		ensure => file,
		owner => root,
		group => root,
		mode  => 0755,
		source => 'puppet:///modules/bootstrapping/motd';
	}
	file{'/etc/bash.bashrc':
		ensure => file,
		owner => root,
		group => root,
		mode  => 0755,
		source => 'puppet:///modules/bootstrapping/bashrc-all';
	}
	file{'/etc/profile':
		ensure => file,
		owner => root,
		group => root,
		mode  => 0755,
		source => 'puppet:///modules/bootstrapping/profile-all';
	}
	file { '/etc/vim/vimrc.local':
		ensure => file,
		owner => root,
		group => root,
		mode  => 0755,
		source => 'puppet:///modules/bootstrapping/vimrc.local';
	}
	file{'/etc/bash.aliases':
		ensure => file,
		owner => root,
		group => root,
		mode  => 0755,
		source => 'puppet:///modules/bootstrapping/bash-aliases';
	}		
} # close boot::base module
