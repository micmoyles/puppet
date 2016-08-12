class packages {
	package { "vim": ensure => latest }
	package { "subversion": ensure => installed }
	package { "telnet": ensure => installed }
	package { "tree": ensure => installed }
	package { "git": ensure => latest }
	package { "pylint": ensure => latest }
	file { '/etc/vim/vimrc':
		ensure => file,
		owner => root,
		group => root,
		mode  => 0755,
		source => 'puppet:///modules/packages/vimrc.local';
	}
}
class workstation_packages inherits packages {
	package { "htop": ensure => installed }
	package { "puppet": ensure => latest }
	package { "python-tk": ensure => latest }
}
class server_packages inherits packages {
	package { "bsd-mailx": ensure => installed }
	package { "postfix": ensure => installed }
	package { "cpuset": ensure => installed }
	package { "keepalived": ensure => installed }
	package { "lldpd": ensure => purged }
}
class erova_packages inherits packages {
	package { "bsd-mailx": ensure => installed }
	package { "postfix": ensure => installed }
	package { "monit": ensure => installed }
	package { "denyhosts": ensure => installed }
}
