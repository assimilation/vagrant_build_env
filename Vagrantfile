# -*- mode: ruby -*-
# vi: set ft=ruby :


boxes = [
    {
        :name => "jenkinsci",
        :eth1 => "192.168.205.10",
        :mem => "512",
        :cpu => "1",
	:box => "scottpgallagher/ubuntu-14_04-jenkins"
    },
    {
        :name => "worker64-ubuntu-14.04",
        :eth1 => "192.168.205.11",
        :mem => "512",
        :cpu => "1",
	:box => "chef/ubuntu-14.04"
    },
    {
        :name => "worker64-ubuntu-12.04",
        :eth1 => "192.168.205.12",
        :mem => "512",
        :cpu => "1",
	:box => "chef/ubuntu-12.04"
    },
    {
        :name => "worker64-centos-6.4",
        :eth1 => "192.168.205.13",
        :mem => "512",
        :cpu => "1",
	:box => "danmikita/centos"
    },
    {
        :name => "worker64-centos-6.5",
        :eth1 => "192.168.205.14",
        :mem => "512",
        :cpu => "1",
	:box => "chef/centos-6.5"
    },
    {
        :name => "worker64-centos-7.0",
        :eth1 => "192.168.205.15",
        :mem => "512",
        :cpu => "1",
	:box => "chef/centos-7.0"
    },
]


Vagrant.configure(2) do |config|

  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.box = opts[:box]

      config.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", opts[:mem]]
        v.customize ["modifyvm", :id, "--cpus", opts[:cpu]]
      end

      if opts[:name].eql? "jenkinsci"

	config.vm.network :forwarded_port, guest: 8080, host: 9090

	#bug workaround https://github.com/mitchellh/vagrant/issues/5973
	#  config.vm.provision :salt do |salt|
	#    salt.minion_config = "salt/minion"
	#    salt.run_highstate = true
	#  end
	#end
	config.vm.provision "shell", path: "install_salt_minion.sh"
	config.vm.provision "shell", path: "install_brightbox_ruby.sh"
	config.vm.provision "shell", path: "install_jenkins_api_client.sh"
	config.vm.synced_folder "salt/roots/", "/srv/salt/"
	  
      end

      config.vm.network :private_network, ip: opts[:eth1]

    end
  end
end



