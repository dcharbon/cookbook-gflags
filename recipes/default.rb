remote_file "/tmp/#{node[:gflags][:package]}" do
  source "#{node[:gflags][:source]}#{node[:gflags][:package]}"
  mode 0644
  #checksum node[:gflags][:checksum]
end

dpkg_package "gflags" do
  source "/tmp/#{node[:gflags][:package]}"
  action :install
end

if node[:gflags][:develop] then
  remote_file "/tmp/#{node[:gflags][:dev_package]}" do
    source "#{node[:gflags][:source]}#{node[:gflags][:dev_package]}"
    mode 0644
    #checksum node[:gflags][:checksum]
  end

  dpkg_package "gflags-dev" do
    source "/tmp/#{node[:gflags][:dev_package]}"
    action :install
  end
end


