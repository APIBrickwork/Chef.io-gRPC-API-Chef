#
# Cookbook Name:: cb-chefmate
# Recipe:: aws_deleteAllMachines
# Author: Tobias Freundorfer
#

require 'chef/provisioning/aws_driver'

with_driver "aws::#{node['chefmate']['machine']['region']}" do

	machine_batch do
  		machines search(:node, '*:*').map { |n| n.name }
  		action :destroy
	end
end