class php::fpm::install {
  package { $php::params::fpm_package_name:
    ensure  => present,
    require => Apt::Ppa['ppa:ondrej/php5'],
  }
}