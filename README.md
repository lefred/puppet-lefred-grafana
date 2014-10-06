Grafana module

ps: doesn't refresh apache

in Hiera:

  classes:
     - grafana

  grafana::version:               "1.8.1"
  grafana::graphite_url:	  "127.0.0.1:8000"
  grafana::elasticsearch:	  "127.0.0.1:9200"

