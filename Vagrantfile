# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.hostname = "python-baseline"

  config.plugin.depend "vagrant-salt", "0.4.0"
  config.plugin.depend "vagrant-cachier", "0.1.0"

  config.cache.auto_detect = true

  config.vm.synced_folder "salt/roots/", "/srv/salt/"

  config.vm.provision :salt do |salt|

    salt.minion_config = "salt/minion"
    salt.run_highstate = true

    salt.verbose = ENV.has_key?('CI') and ENV['CI']

  end
end
