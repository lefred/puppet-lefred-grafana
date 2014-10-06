class grafana::config {

   case $::osfamily {
	'RedHat': {
		$fileloc = "/etc/httpd/conf.d/grafana.conf" 
	}
	'Debian': {
		$fileloc = "/etc/apache2/sites-enabled/grafana.conf"
	}
   }  


   file {
	$fileloc:
		ensure  => present,
		source  => "puppet:///modules/grafana/grafana.conf", 
		notify  => Service['httpd'],
   }
}
