node['getninjas_logstash']['extras_packages'].each do |pkg|
  apt_package pkg do
    action :upgrade
  end
end