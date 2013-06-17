# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define :precise64 do |precise64|
      precise64.vm.box = "precise64"
      precise64.vm.box_url = "http://files.vagrantup.com/precise64.box"
      precise64.vm.hostname = "python-baseline-precise64"
  end

  if ENV.has_key?('CI') and ENV['CI'] == "true"
      config.vm.define :precise32 do |precise32|
          precise32.vm.box = "precise32"
          precise32.vm.box_url = "http://files.vagrantup.com/precise32.box"
          precise32.vm.hostname = "python-baseline-precise32"
      end

      config.vm.define :lucid64 do |lucid64|
          lucid64.vm.box = "lucid64"
          lucid64.vm.box_url = "http://files.vagrantup.com/lucid64.box"
          lucid64.vm.hostname = "python-baseline-lucid64"
      end

      config.vm.define :lucid32 do |lucid32|
          lucid32.vm.box = "lucid32"
          lucid32.vm.box_url = "http://files.vagrantup.com/lucid32"
          lucid32.vm.hostname = "python-baseline-lucid32"
      end
  end

  config.plugin.depend "vagrant-salt", "0.4.0"
  config.plugin.depend "vagrant-cachier", "0.1.0"

  config.cache.auto_detect = true

  config.vm.synced_folder "salt/roots/", "/srv/salt/"

  config.vm.provision :salt do |salt|

    salt.minion_config = "salt/minion"
    salt.run_highstate = true

    salt.verbose = ENV.has_key?('CI') and ENV['CI'] == "true"

  end
end
