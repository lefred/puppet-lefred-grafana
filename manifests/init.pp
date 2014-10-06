class grafana ($version="1.8.1", $graphite_url="127.0.0.1:8000", $elasticsearch_url="127.0.0.1:9200") {

   include grafana::packages	
   include grafana::config

   Class['grafana::packages']->Class['grafana::config']	
}
