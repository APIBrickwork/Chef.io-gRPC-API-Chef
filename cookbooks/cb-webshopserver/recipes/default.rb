#
# Cookbook Name:: cb-webshopserver
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Only necessary if you want to provision to AWS (comment out if using Kitchen!!)
#include_recipe 'cb-webshopserver::webshopserver'

# Set java attributes 
node.default['java']['install_flavor'] = 'oracle'
node.default['java']['jdk_version'] = '8'
node.default['java']['oracle']['accept_oracle_download_terms'] = true

# Install java
include_recipe 'java::default'

# Download webshopserver from Github
execute 'downloadWSS' do
	command 'cd ~ && wget https://github.com/tfreundo/LabCourse-group4-SS2016/releases/download/webshop_v1.1/webshopserver-1.1-jar-with-dependencies.jar'
end

# Execute webshopserver
execute 'startWSS' do
	command 'cd ~ && java -jar webshopserver-1.1-jar-with-dependencies.jar -p 8080 &'
end