#
# Cookbook Name:: packages
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# Package dependencies
include_recipe 'homebrew'
node['laptop']['brew_packages'].each do |pkg|
  package pkg do
    action :install
  end
end

homebrew_tap 'caskroom/cask'
homebrew_cask 'gpgtools'

# Python
python_package 'awscli'

# Google chrome
dmg_package 'Google Chrome' do
  dmg_name 'googlechrome'
  source   'https://dl-ssl.google.com/chrome/mac/stable/GGRM/googlechrome.dmg'
  checksum '7daa2dc5c46d9bfb14f1d7ff4b33884325e5e63e694810adc58f14795165c91a'
  action   :install
end

# Dropbox
dmg_package 'Dropbox' do
  volumes_dir 'Dropbox Installer'
  source      'http://www.dropbox.com/download?plat=mac'
  action      :install
end

# slack
ark 'Slack.app' do
  url  'https://downloads.slack-edge.com/mac_public_releases/slack-2.0.3.zip'
  path '/Applications/'
  action :put
end

# telegram
dmg_package 'Telegram' do
  volumes_dir 'Telegram Desktop'
  source      'https://tdesktop.com/mac'
  action      :install
end

# iterm2
ark 'Iterm2.app' do
  url  'https://iterm2.com/downloads/stable/iTerm2-2_1_4.zip'
  path '/Applications/'
  action :put
end

# atom
ark 'Atom.app' do
  url 'https://atom.io/download/mac'
  extension 'zip'
  path '/Applications/'
  action :put
end

execute 'atom package install' do
  command '/usr/local/bin/apm install ' + node['laptop']['atom']['packages'].join(' ')
  action :run
end

remote_directory '/Users/' + node['laptop']['username'] + '/atom' do
  source 'atom'
  owner node['laptop']['username']
  mode '00755'
  action :create
end
