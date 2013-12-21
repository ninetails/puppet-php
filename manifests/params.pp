class php::params {
  case $::osfamily {
    debian: {
      $hostname = "vagrant.ninetails.com.br"
      $vagrant_dir = '/vagrant'
      $public_dir = "${vagrant_dir}"
      $apache_package_name = 'apache2'
      $apache_service_name = 'apache2'
      $apache_dir = '/etc/apache2'
      $apache_sites_available_dir = "${apache_dir}/sites-available"
      $php_dir = '/etc/php5'
      $php_package_name = 'php5'
      $php_xdebug_package = 'php5-xdebug'
      $php_module_prefix = 'php5-'
      $fpm_package_name = 'php5-fpm'
      $fpm_service_name = 'php5-fpm'
      $fpm_dir = "${php_dir}/fpm"
      $pear_package_name = 'php-pear'
    }
    default: {
      case $::operatingsystem {
        default: {
          fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
        }
      }
    }
  }
}
