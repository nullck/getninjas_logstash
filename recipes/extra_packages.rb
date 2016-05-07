node['getninjas_logstash']['extras_packages'].each do |pkg|
  package pkg do
    action :install
  end
end