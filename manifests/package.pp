class offlineimap::package {

  package  { $offlineimap::packages:
    ensure => $offlineimap::ensure,
  }

}
