class directories::home {
	file { '/home/mmoyles':
		owner  => mmoyles, group => mmoyles, mode => 0755,
		ensure => "directory",
	}
	file { '/home/mmoyles/.ssh':
		owner  => mmoyles, group => mmoyles, mode => 0755,
		ensure => "directory",
	}
}

class directories::home::pi inherits directories::home {
	file { '/home/michael':
		owner => michael, group => michael, mode => 0755,
		ensure => "directory",
	}

}
