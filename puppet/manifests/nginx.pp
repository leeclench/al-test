# Installs nginx, creates a basic helloworld html and runs on the service
class nginx::install {
  package {
    "nginx": ensure => present;
  }

  file {
    "Hello World":
      path    => "/var/www/nginx-default/index.html",
      content => "Hello World!",
      require => Package["nginx"];
  }

  service {
    "nginx":
      ensure    => running,
      enable    => true,
      hasstatus => true,
      require   => [Package["nginx"], File["Hello World"]];
  }
}
# The default app includes the install and vagrant sudoers addition
node default {
  include nginx::install
  include sudoers
}
