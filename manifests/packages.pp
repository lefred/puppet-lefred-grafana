class grafana::packages {

   $version = $grafana::version
 
   exec {
      'install_grafana':
	command   => "curl http://grafanarel.s3.amazonaws.com/grafana-${version}.tar.gz | tar zx",
        cwd       => "/usr/share/",
        path      => "/bin/:/usr/bin/:/sbin/:/usr/sbin",
        unless    => "ls /usr/share/grafana-${version} 2>/dev/null", 
   }

   file {
      '/usr/share/grafana':
        ensure    => link,
        target    => "/usr/share/grafana-${version}",
        require   => [ Exec['install_grafana'], Class['elasticsearch'] ] ,
   }

}
