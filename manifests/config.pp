class grafana::config {

   $graphite_url      = $grafana::graphite_url
   $elasticsearch_url = $grafana::elasticsearch_url

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
		source  => "puppet:///modules/grafana/grafana.conf";
	"/usr/share/grafana/config.js":
		ensure => present,
		content => template("grafana/config.js.erb");
   }
}
