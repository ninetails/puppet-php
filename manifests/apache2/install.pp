class php::apache2::install {
  package { $php::params::apache_package_name:
    ensure => present,
  }
}
