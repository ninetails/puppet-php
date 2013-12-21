class php::pear::install {
  package { $php::params::pear_package_name:
    ensure => 'present',
  }
}
