default['getninjas_logstash']['instance_default']['elasticsearch_cluster'] = 'logstash'
default['getninjas_logstash']['service_name'] = 'logstash'
default['getninjas_logstash']['instance_default']['elasticsearch_ip'] = ''
default['getninjas_logstash']['instance_default']['elasticsearch_port'] = ''
default['getninjas_logstash']['instance_default']['elasticsearch_flush_time'] = 1000
default['getninjas_logstash']['instance_default']['elastic_idle_flush_time'] = 2
default['getninjas_logstash']['instance_default']['redis_ip'] = ''
default['getninjas_logstash']['instance_default']['bind'] = ''
default['getninjas_logstash']['instance_default']['redis_port'] = 6379
default['getninjas_logstash']['curator'] == false
default['getninjas_logstash']['extras_packages'] = [ 'git' ]

