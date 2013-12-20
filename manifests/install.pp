class php::install {
  package { $php::params::php_basic_packages:
    ensure => present,
  }
}
