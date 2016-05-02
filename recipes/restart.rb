#Start or Restart Service
service "logstash" do
	provider Chef::Provider::Service::Upstart
	supports :restart => true, :reload => true
  	action :restart
  end