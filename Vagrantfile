# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.hostname = "python-baseline"

  config.plugin.depend "vagrant-salt", "0.4.0"

  config.vm.synced_folder "salt/roots/", "/srv/salt/"

  config.vm.provision :salt do |salt|

    salt.run_highstate = true

  end
end
