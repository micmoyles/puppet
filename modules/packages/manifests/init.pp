class packages {
	package { "vim": ensure => installed }
	package { "subversion": ensure => installed }
	package { "telnet": ensure => installed }
	package { "tree": ensure => installed }
	package { "git": ensure => latest }
	package { "pylint": ensure => latest }
}
class workstation_packages inherits packages {
	notify {'Hello from workstation packages!': withpath => true, }
	package { "htop": ensure => installed }
	package { "puppet": ensure => latest }
	package { "python-tk": ensure => latest }
}
class server_packages inherits packages {
	notify  {'Hello from server packages!': withpath => true, }
	package { "bsd-mailx": ensure => installed }
	package { "cpuset": ensure => installed }
	package { "keepalived": ensure => installed }
	package { "lldpd": ensure => purged }
}
