# -*- mode: ruby -*-
# vi: set ft=ruby :
  
ENV['DEPLOY_KEY_PATH'] ||= '~/.ssh/id_rsa'

SYNC_ENV = <<-SHELL
cat >> /etc/profile.d/bitbroadcast-dev-env.sh << EOF
export AWS_ACCESS_KEY_ID=#{ENV['AWS_ACCESS_KEY_ID']}
export AWS_SECRET_ACCESS_KEY=#{ENV['AWS_SECRET_ACCESS_KEY']}
EOF
SHELL

Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise64"

  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
  config.vm.provision "file", source: ENV['DEPLOY_KEY_PATH'], destination: ".ssh/id_rsa"
  config.vm.provision "shell", inline: SYNC_ENV
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y curl git zip vim python-pip
    curl --silent --location https://deb.nodesource.com/setup_0.12 | bash -
    apt-get install -y nodejs
    pip install awsebcli awscli
    npm install --global babel
  SHELL

  config.vm.provider "virtualbox" do |v|
    v.gui = false
  end

end
