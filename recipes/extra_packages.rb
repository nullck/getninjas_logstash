node['getninjas_logstash']['extras_packages'].each do |pkg|
  apt_package pkg do
    action :upgrade
    notifies :install, 'dpkg_package[logstash]', :delayed
  end
end