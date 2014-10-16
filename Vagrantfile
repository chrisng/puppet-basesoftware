# -*- mode: ruby -*-
# vi: set ft=ruby :

boxes = [
    { :name => :centos6, :ip => '192.168.50.80', :box => 'hashicorp/precise64' },
    { :name => :ubuntu,  :ip => '192.168.50.81', :box => 'ubuntu/trusty64' },
]
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    boxes.each do |opts|
        config.vm.define opts[:name] do |config|
                # Box basics
            config.vm.box = opts[:box]
            #config.vm.box_url = "http://files.vagrantup.com/precise64.box"
            config.vm.network :private_network, ip: opts[:ip]
            config.ssh.forward_agent = true

            # Use a more recent version of Chef
            #config.vm.provision :shell, :inline => "gem install chef --version 11.6.0 --no-rdoc --no-ri --conservative"

            # Run shell commands for box
            #opts[:commands].each do |command|
            #    config.vm.provision :shell, :inline => command    
            #end

            config.vm.provision :puppet do |puppet|
                puppet.manifest_file = 'init.pp'
            end
        end
    end
end
