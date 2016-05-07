#Create Directory
directory "/etc/pki/tls/certs/" do
	recursive true
	mode '0755'
end

directory "/etc/pki/tls/private/" do
	recursive true
	mode '0755'
end

# Add logstash keys
cookbook_file "/etc/pki/tls/certs/logstash-forwarder.crt" do
	source "logstash-forwarder.crt"
	owner "root"
	group "root"
	mode 0644
end
cookbook_file "/etc/pki/tls/private/logstash-forwarder.key" do
	source "logstash-forwarder.key"
	owner "root"
	group "root"
	mode 0644
end

bash "Removing nice cpu" do
	user "root"
	group "root"
	cwd "/tmp"
	code <<-EOH
	sed -i 's/LS_NICE=.*/LS_NICE=0/' /etc/init/logstash.conf
	sed -i "s/LS_CONF_DIR=.*/LS_CONF_DIR=\\/etc\\/logstash\\/conf.d\\/*.conf/" /etc/init/logstash.conf
	sed -i 's/LS_HEAP_SIZE=.*/LS_HEAP_SIZE=\"128m\"/' /etc/init/logstash.conf
	EOH
   	action :run
end

### adding files templates to /etc/logstash/conf.d/ dir###

template '/etc/logstash/conf.d/02-redis-input.conf' do
  action :create
  source '02-redis-input.conf.erb'
  owner 'root'
  mode '0644'
  variables({
  	:redis_ip => node['getninjas_logstash']['instance_default']['redis_ip']
  	})
  notifies :reload, "service[#{node['getninjas_logstash']['service_name']}]", :delayed
end

template '/etc/logstash/conf.d/39-elasticsearch-output.conf' do
  action :create
  source '39-elasticsearch-output.conf.erb'
  owner 'root'
  mode '0644'
  variables({
    :elasticsearch_ip => node['getninjas_logstash']['instance_default']['elasticsearch_ip'],
    :elasticsearch_flush_time => node['getninjas_logstash']['instance_default']['elasticsearch_flush_time'],
    :elastic_idle_flush_time => node['getninjas_logstash']['instance_default']['elastic_idle_flush_time'],
    :elasticsearch_port => node['getninjas_logstash']['instance_default']['elasticsearch_port']
  })
  notifies :reload, "service[#{node['getninjas_logstash']['service_name']}]", :delayed
end

remote_directory "/etc/logstash/conf.d/patterns" do
	source "patterns"
	owner "root"
	group "root"
	mode 0744
end

cookbook_file "/etc/logstash/conf.d/01-lumberjack-input.conf" do
	source "01-lumberjack-input.conf"
	owner "root"
	group "root"
	mode 0744
end

cookbook_file "/etc/logstash/conf.d/29-mutate-filter.conf" do
	source "29-mutate-filter.conf"
	owner "root"
	group "root"
	mode 0744
end
