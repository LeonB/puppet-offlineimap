class offlineimap::service {

  service { 'offlineimap':
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['offlineimap::package'],
  }
}
