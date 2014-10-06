class grafana::packages ($version="1.8.1") {
 
   exec {
      'install_grafana':
	command   => "wget http://grafanarel.s3.amazonaws.com/grafana-${version}.tar.gz && tar zxvf grafana-${version}.tar.gz && rm grafana-${version}.tar.gz",
        cwd       => "/usr/share/",
        path      => "/bin/:/usr/bin/:/sbin/:/usr/sbin",
        unless    => "ls /usr/share/grafana-${version} 2>/dev/null", 
   }

   file {
      '/usr/share/grafana':
        ensure    => link,
        target    => "/usr/share/grafana-${version}",
        require   => Exec['install_grafana'],
   }

}
