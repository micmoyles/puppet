class packages {
	package { "vim": ensure => installed }
	package { "subversion": ensure => installed }
	package { "telnet": ensure => installed }
	package { "bsd-mailx": ensure => installed }
	package { "cpuset": ensure => installed }
	package { "keepalived": ensure => installed }
}
class workstation_packages {
	notify {'Hello from workstation packages!': withpath => true, }
	package { "vim": ensure => installed }
	package { "subversion": ensure => installed }
	package { "htop": ensure => installed }
	package { "puppet": ensure => latest }
	package { "tree": ensure => latest }
	package { "python-tk": ensure => latest }
}
