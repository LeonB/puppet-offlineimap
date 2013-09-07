class offlineimap::service {

  service { 'offlineimap':
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['offlineimap::package'],
  }
}
