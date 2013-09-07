class offlineimap(
  $packages = params_lookup( 'packages' ),
  $enabled  = params_lookup( 'enabled' ),
  $user     = params_lookup( 'user' ),
  ) inherits offlineimap::params {

    $ensure = $enabled ? {
      true => present,
      false => absent
    }

  if !$user {
    fail("offlineimap::user is not test: skipping offlineimap")
  }

  include offlineimap::package, offlineimap::config, offlineimap::service
}
