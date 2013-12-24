class php::apache2 {
  include php::params
  include php::ppa
  include php::apache2::install
  include php::apache2::config
  include php::apache2::service
}
