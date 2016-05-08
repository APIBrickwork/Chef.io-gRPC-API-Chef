#
# Cookbook Name:: Chefmate
# Recipe:: aws_provision
#
#

# Use AWS to provision to
require 'chef/provisioning/aws_driver'

with_driver "aws::#{node['chefmate']['machine']['region']}" do

	with_machine_options({
		bootstrap_options: {
    	# http://docs.aws.amazon.com/sdkforruby/api/Aws/EC2/Resource.html#create_instances-instance_method
    	# lists the available options.  The below options are the default
    	image_id: "#{node['chefmate']['machine']['imageid']}",
    	instance_type: "#{node['chefmate']['machine']['instancetype']}",
    	security_group_ids: "#{node['chefmate']['machine']['defaultsecuritygroupdids']}"
  		}
	})
	
	machine "#{node['chefmate']['machine']['name']}" do
   		tag "#{node['chefmate']['machine']['tag']}"
   		action :allocate
	end


end
