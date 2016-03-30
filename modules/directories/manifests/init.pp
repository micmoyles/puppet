class home_dirs {
	file { '/home/mmoyles':
		owner => mmoyles, group => mmoyles, mode => 0755,
		ensure => "directory",
	}
	file { '/home/erova':
		owner => erova, group => erova, mode => 0755,
		ensure => "directory",
	}
	file { '/home/michael':
		owner => michael, group => michael, mode => 0755,
		ensure => "directory",
	}
}
