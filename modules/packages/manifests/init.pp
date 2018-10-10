class packages::base {
	package { "vim": ensure => latest }
	package { "subversion": ensure => installed }
	package { "telnet": ensure => installed }
	package { "tree": ensure => installed }
	package { "git": ensure => latest }
	package { "pylint": ensure => purged }
	package { "apt-transport-https": ensure => latest } # required for both puppet and docker
	package { "ca-certificates": ensure => latest }     # to allow apt to use https
	package { "curl": ensure => latest }
	package { "lsof": ensure => installed }
	package { "python-numpy": ensure => installed }
	package { "python-scipy": ensure => installed }
 	package { "python-matplotlib": ensure => installed }
  package { "htop": ensure => installed }
  package { "traceroute": ensure => installed }


	file { '/etc/vim/vimrc':
		ensure => file,
		owner => root,
		group => root,
		mode  => 0755,
		source => 'puppet:///modules/packages/vimrc.local';
	}
}

class packages::workstation inherits packages::base {
	package { "puppet": ensure => installed }
	package { "python-tk": ensure => installed }
  package { "texlive-latex-base": ensure => installed } # for pdflatex
}
class packages::server inherits packages::base {
	package { "cpuset": ensure => installed }
	package { "keepalived": ensure => installed }
	package { "lldpd": ensure => purged }
 	package { "monit": ensure => installed }
  package { "postfix": ensure => installed }
}
