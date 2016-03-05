# -*- mode: ruby -*-
# vi: set ft=ruby :

hostname = ENV['HOSTNAME'] ? ENV['HOSTNAME'] : 'sitespeed'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.network "public_network"
    config.vm.hostname = "#{hostname}"

    config.vm.define "u14" do |u14|
      u14.vm.box = 'bento/ubuntu-14.04'
    end

    config.vm.provider :virtualbox do |vb|
      vb.name = "#{hostname}"
      vb.memory = 1024
      vb.cpus = 1
    end

    config.vm.provision :shell, :path => "scripts/bootstrap.sh"
end
