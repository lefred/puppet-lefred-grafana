class grafana {

   include grafana::packages	
   include grafana::config

   Class['grafana::packages']->Class['grafana::config']	
}
