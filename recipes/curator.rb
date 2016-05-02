bash 'install_curator' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  pip install elasticsearch-curator
  EOH
end

cookbook_file "/usr/local/bin/curator.sh" do
  source "curator.sh"
  owner "root"
  group "root"
  mode "0700"
end
