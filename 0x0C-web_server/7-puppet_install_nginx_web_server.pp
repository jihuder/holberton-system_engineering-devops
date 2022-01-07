# Installs NGINX using puppet
package {'Install nginx':
	ensure => installed,
	name   => 'nginx',
}
file_line {'title':
	ensure   => 'present',
	path     => '/etc/nginx/sites-available/default',
	after    => 'listen 80 default_server;',
	line     => 'rewrite ^/redirect_me https://https://www.youtube.com/watch?v=x2T2NxXX3dM permanent;',
	multiple => true,
}
file{'path':
	content => 'Hello World',
	path    => '/var/www/html/index.html',
}
service {'nginx':
	ensure  => running,
	require => Package['nginx'],
}
