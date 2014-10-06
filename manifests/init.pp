class grafana ($version="1.8.1") {

   include grafana::packages	
   include grafana::config

   Class['grafana::packages']->Class['grafana::config']	
}
