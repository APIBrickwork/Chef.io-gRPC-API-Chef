#
# Cookbook Name:: cb-mysqlServer
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Configure the MySQL client.
mysql_client "#{node['chefmate']['machine']['mysql']['servicename']}" do
  action :create
end

mysql_service "#{node['chefmate']['machine']['mysql']['servicename']}" do
  port "#{node['chefmate']['machine']['mysql']['port']}"
  version '5.5'
  bind_address '0.0.0.0'
  initial_root_password "#{node['chefmate']['machine']['mysql']['rootpw']}"
  action [:create, :start]
end

mysql_database_user 'wp' do
  connection(
    :host => '127.0.0.1',
    :username => 'wp',
    :password => "#{node['chefmate']['machine']['mysql']['rootpw']}"
  )
  password 'wppw'
  database_name 'wordpressdb'
  host '%'
  action [:create, :grant]
end