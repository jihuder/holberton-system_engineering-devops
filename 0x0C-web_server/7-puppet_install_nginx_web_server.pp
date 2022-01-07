# Installs NGINX using puppet
package {'Install nginx':
    ensure => installed,
    name   => 'nginx',
}
file_line {'redirection-301':
    ensure => 'present',
    path   => '/etc/nginx/sites-available/default',
    after  => 'server_name _;',
    line   => 'rewrite ^/redirect_me https://https://www.youtube.com/watch?v=x2T2NxXX3dM permanent;',
}
file{'path':
    content => 'Hello World',
    path    => '/var/www/html/index.html',
}
service {'nginx':
    ensure  => running,
    require => Package['nginx'],
}
