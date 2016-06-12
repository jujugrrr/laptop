#
# Cookbook Name:: packages
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# Package dependencies
cookbook_file '/Users/' + node['laptop']['username'] + '/.gitconfig' do
  source 'git/gitconfig'
  owner node['laptop']['username']
  mode 00644
end
