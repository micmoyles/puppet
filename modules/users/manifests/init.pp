
# Note on passwds
# The must be stored as a hash generated from openssl
# openssl passwd -1 is the command

class users {
# passwd is wiarreft
        user { 'mmoyles':
        	home => '/home/mmoyles',
        	ensure => present,
		password => '$1$rLrcsrrZ$/VnY4X1rlaIJ31FMBiEld0',
        	comment => 'Michael Moyles',
        	shell => '/bin/bash',
        	groups => ['svn','puppet','sudo','erova']
	    }
#	file { '/home/mmoyles/.ssh/amazon_linux.pem':
#		ensure => file,
#		owner => mmoyles,
#		group => mmoyles,
#		mode  => 0600,
#		source => 'puppet:///modules/users/amazon_linux.pem';
#	}

	}

# best to try using managehome => true but this actually doesn't seem to work
class users::pi inherits users {

# passwd is wiarreft
        user { 'michael':
        home => '/home/michael',
        ensure => present,
        managehome => true,
	password => '$1$UfXQTHh1$I070bUWksoJrrHRrB08vn1',
        comment => 'user michael',
        shell => '/bin/bash',
        groups => ['svn','puppet','sudo','erova']
    }
}
class users::erova inherits users {

        user { 'erova':
   		home => '/home/erova',
        	ensure => present,
		password => '$1$JaQmbDDv$4XzeggNopjsO4507Vq0uT/', #erova123
        	comment => 'Erova, shared user',
        	shell => '/bin/bash',
        	groups => ['svn','erova']
   	 }
        user { 'mgolden':
   		home => '/home/mgolden',
        	ensure => present,
		password => '$1$IggdB0.D$f8PMmLrohZwsVBCKSqx9V1', #gmatt1
        	comment => 'Matt Golden',
        	shell => '/bin/bash',
        	groups => ['svn','erova','sudo']
   	 }
        user { 'mbrennan':
   		home => '/home/mbrennan',
        	ensure => present,
		password => '$1$uPryyIuC$VE2MWYR9t7MQFLCyNUq/B1',#bmich1
        	comment => 'Michael Brennan'
        	shell => '/bin/bash',
        	groups => ['svn','erova','sudo']
   	 }
}

