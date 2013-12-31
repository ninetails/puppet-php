class php::config {
  package { $php::params::php_xdebug_package:
    ensure  => 'installed',
    require => Package[$php::params::php_package_name],
  }

  file { "${php::params::php_dir}/mods-available/local.ini":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => "puppet:///modules/php/local.ini",
    require => Package[$php::params::php_package_name],
  }

  if (defined(Package['php5-cli'])) {
    file { "${php::params::php_cli_dir}/conf.d/00-local.ini":
      ensure  => 'link',
      target  => "${php::params::php_dir}/mods-available/local.ini",
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      require => [
        File["${php::params::php_dir}/mods-available/local.ini"],
        Package['php5-cli']
      ],
      notify  => Class['php::fpm::service'],
    }
  }
}