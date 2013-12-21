define php::pear (
    $command = undef
  ){
  include php
  include php::pear::install
  include php::pear::config

  $cmd = $command ? {
    undef => "pear install -o ${name}",
    default => $command,
  }

  exec { "pear ${name}":
    command => $cmd,
    require => Exec['pear update-channels'],
  }
}
