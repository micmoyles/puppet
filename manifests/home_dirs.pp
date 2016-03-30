
class home_dirs {
	file { '/home/mmoyles':
		owner => mmoyles, group => mmoyles, mode => 0755,
		ensure => "directory",
	}
}

