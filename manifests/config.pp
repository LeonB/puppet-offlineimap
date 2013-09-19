class offlineimap::config {

  ## do package before config
  Class['offlineimap::package'] -> Class['offlineimap::config']

  $directory_ensure = $offlineimap::ensure ? {
    present => directory,
    default => $offlineimap::ensure
  }

  file { '/etc/default/offlineimap':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('offlineimap/default/offlineimap.erb'),
    require => Class['offlineimap::package']
  }

  file { "/etc/init.d/offlineimap":
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/offlineimap/init.ubuntu',
    require => Class['offlineimap::package']
  }

  # Make sure PID directory exists for init script
  file { '/var/run/offlineimap':
    ensure  => $directory_ensure,
    owner   => root,
    group   => root,
    mode    => '0777'
  }

  # if laptop_mode_tools is installed: disable offlinemap when on battery
  if defined(laptop_mode_tools::control_service) {
    laptop_mode_tools::control_service { 'offlineimap': }
  }

}
