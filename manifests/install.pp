class php::install {
  package { $php::params::php_package_name:
    ensure => present,
  }
}
