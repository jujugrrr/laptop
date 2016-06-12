#
# Cookbook Name:: packages
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file '/Users/' + node['laptop']['username'] + '/.vimrc' do
  source 'vim/vimrc'
  owner node['laptop']['username']
  mode 00644
end
