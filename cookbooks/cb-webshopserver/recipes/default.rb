#
# Cookbook Name:: cb-webshopserver
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Only necessary if you want to provision to AWS (comment out if using Kitchen!!)
include_recipe 'cb-webshopserver::webshopserver'

# Set java attributes 
node.default['java']['install_flavor'] = 'oracle'
node.default['java']['jdk_version'] = '8'
node.default['java']['oracle']['accept_oracle_download_terms'] = true

# Install java
include_recipe 'java::default'

# Download webshopserver from Github
execute 'downloadWSS' do
	command 'wget https://github.com/tfreundo/LabCourse-group4-SS2016/releases/download/webshop_v1.0/webshopserver-v1.0.jar'
end

# Execute webshopserver
execute 'startWSS' do
	command 'java -jar webshopserver-v1.0.jar'
end