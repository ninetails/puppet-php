class php::apache2::service {
  service { $php::params::apache_service_name:
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['php::apache2::config'],
  }
}
