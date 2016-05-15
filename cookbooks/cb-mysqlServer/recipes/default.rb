#
# Cookbook Name:: cb-mysqlServer
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
mysql_service 'cloud' do
  port '3306'
  version '5.5'
  initial_root_password 'cloud2016'
  action [:create, :start]
end
