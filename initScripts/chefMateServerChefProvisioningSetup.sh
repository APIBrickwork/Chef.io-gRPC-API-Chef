#!/bin/bash
# This script creates the aws credentials folder and files and sets everything up for Chef Provisioning (with AWS)
# author: Tobias Freundorfer
# date: 09.05.2016

##########
# WARNING#
##########
# This script is for automatic setup for ChefMateServer
# DO NOT!!!! use it on your local machine


echo "### Starting Setup for Chef Provisioning with AWS ###"

credentialsDir=".aws"
credentialFilename="credentials"
configFilename="config"
ChefConfigDir="chefmateserver/LabCourse-group4-SS2016-CHEFrepo/.chef/"
chefCookbookPath="chefmateserver/LabCourse-group4-SS2016-CHEFrepo/cookbooks"
chefRepoPath="chefmateserver/LabCourse-group4-SS2016-CHEFrepo"
knifeConfigFilename="knife.rb"

echo '### Creating .aws folder in the home directory ###'
# Create folder and files
cd ~
mkdir $credentialsDir
cd $credentialsDir
touch $credentialFilename


echo "### Creating AWS credential file ###"

# Write default credentials to file
echo '[default]' > $credentialFilename
echo "aws_access_key_id = $1" >> $credentialFilename
echo "aws_secret_access_key = $2" >> $credentialFilename

echo "### Creating AWS Config file ###"
touch $configFilename
echo 'export CHEF_DRIVER=aws # on Unix' > $configFilename

mkdir /etc/chef

echo "### Creating the knife.rb (Chef knife configuration file) ###"

cd ~
mkdir $ChefConfigDir
cd $ChefConfigDir
touch $knifeConfigFilename
echo "knife[:aws_credential_file] = \"$HOME/$credentialsDir/$credentialFilename\"" > $knifeConfigFilename
echo "knife[:ssh_key_name] = \"chefmateserver_key\"" >> $knifeConfigFilename
echo "knife[:region] = \"eu-central-1\"" >> $knifeConfigFilename
echo "cookbook_path \"$HOME/$chefCookbookPath\"" >> $knifeConfigFilename
echo "chef_repo_path \"$HOME/$chefRepoPath\"" >> $knifeConfigFilename

echo "### Removing config.rb because ChefMateServer doesnt need it"
rm $HOME/$chefRepoPath/config.rb
