# Logstash uses a java runtime
package "openjdk-7-jre-headless"

# Gets the Logstash version 1.4.2
remote_file "/tmp/logstash_1.4.2-1-2c0f5a1_all.deb" do
	source "https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash_1.4.2-1-2c0f5a1_all.deb"
end

# Installs Logstash .deb Package. 
dpkg_package "logstash" do
	action :install
	source "/tmp/logstash_1.4.2-1-2c0f5a1_all.deb"
	provider Chef::Provider::Package::Dpkg
end

node['getninjas_logstash']['extras_packages'].each do |pkg|
  apt_package pkg do
    action :upgrade
  end
end