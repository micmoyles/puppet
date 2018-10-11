class packages::base {
	package { "vim": ensure => installed }
	package { "subversion": ensure => installed }
	package { "telnet": ensure => installed }
	package { "tree": ensure => installed }
	package { "git": ensure => installed }
	package { "apt-transport-https": ensure => installed } # required for both puppet and docker
	package { "ca-certificates": ensure => installed }     # to allow apt to use https
	package { "curl": ensure => installed }
	package { "lsof": ensure => installed }
	package { "python-numpy": ensure => installed }
	package { "python-scipy": ensure => installed }
 	package { "python-matplotlib": ensure => installed }
  package { "htop": ensure => installed }
  package { "traceroute": ensure => installed }
	package { "ngrep" : ensure => installed }
  package { "at" : ensure => installed }



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
 	package { "monit": ensure => installed }
  package { "postfix": ensure => installed }
}
