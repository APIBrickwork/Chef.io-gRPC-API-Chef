#
# Cookbook Name:: WebshopServer
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Use AWS to provision to
require 'chef/provisioning/aws_driver'

with_driver 'aws::eu-central-1' do

	with_machine_options({
		bootstrap_options: {
    	# http://docs.aws.amazon.com/sdkforruby/api/Aws/EC2/Resource.html#create_instances-instance_method
    	# lists the available options.  The below options are the default
    	image_id: "ami-87564feb",
    	instance_type: "t2.micro",
    	security_group_ids: ["sg-79ae5d11"]
  		}
	})
	
	machine 'webshopserver' do
   		tag 'WebshopServer'
   		action :allocate
	end


end
