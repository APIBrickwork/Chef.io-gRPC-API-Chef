#
# Cookbook Name:: Chefmate
# Recipe:: aws_provision
#
#

# Use AWS to provision to
require 'chef/provisioning/aws_driver'

# Using Ruby to get home-directory
home = File.expand_path('~') 

with_driver "aws::#{node['chefmate']['machine']['region']}" do

  # Create ssh key-pair
  aws_key_pair 'chefmateserver_key' do
    private_key_path "#{home}/.ssh/chefmateserver_key.pem"
    public_key_path "#{home}/.ssh/chefmateserver_key.pub"
    allow_overwrite false # True regenerates the key every run!
  end

  with_machine_options({
    bootstrap_options: {
      # http://docs.aws.amazon.com/sdkforruby/api/Aws/EC2/Resource.html#create_instances-instance_method
      # lists the available options.  The below options are the default
      image_id: "#{node['chefmate']['machine']['imageid']}",
      instance_type: "#{node['chefmate']['machine']['instancetype']}",
      security_group_ids: "#{node['chefmate']['machine']['defaultsecuritygroupdids']}",
      key_name: 'chefmateserver_key',
      key_path: "#{home}/.ssh"
      }
  })
  
  machine "#{node['chefmate']['machine']['name']}" do
      tag "#{node['chefmate']['machine']['tag']}"
      # Be sure to fix the converge bug with long AWS ID's (see this Github Repo Issue #3)
      action :converge
  end



end