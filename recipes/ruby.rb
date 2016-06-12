execute 'ruby install with rbenv' do
  user node['laptop']['username']
  command 'rbenv install 2.3.1 -s'
  action :run
end
