git "/Users/#{node['laptop']['username']}/.bash_it" do
  repository 'https://github.com/Bash-it/bash-it.git'
  revision 'master'
  ssh_wrapper '/tmp/chef_git_ssh.sh'
  action :sync
end

template "/Users/#{node['laptop']['username']}/.bash_profile" do
  source 'bash_profile.erb'
  owner node['laptop']['username']
  mode 00644
end
