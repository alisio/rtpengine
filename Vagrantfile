# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "centos/7"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 5060, host: 5060, protocol: "udp"
  # config.vm.network "forwarded_port", guest: 10000, host: 10000, protocol: "udp"
  # config.vm.network "forwarded_port", guest: 10001, host: 10001, protocol: "udp"
  # config.vm.network "forwarded_port", guest: 10002, host: 10002, protocol: "udp"
  # config.vm.network "forwarded_port", guest: 10003, host: 10003, protocol: "udp"
  # config.vm.network "forwarded_port", guest: 10004, host: 10004, protocol: "udp"
  # config.vm.network "forwarded_port", guest: 10005, host: 10005, protocol: "udp"
  # config.vm.network "forwarded_port", guest: 10006, host: 10006, protocol: "udp"
  # config.vm.network "forwarded_port", guest: 10007, host: 10007, protocol: "udp"
  # config.vm.network "forwarded_port", guest: 10008, host: 10008, protocol: "udp"
  # config.vm.network "forwarded_port", guest: 10009, host: 10009, protocol: "udp"
  # config.vm.network "forwarded_port", guest: 10010, host: 10010, protocol: "udp"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
#  config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  #config.vm.synced_folder ".", "/vagrant"
  config.vm.synced_folder ".", "/vagrant", type: "nfs"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    echo timeout=80 >> /etc/yum.conf
    sudo rpm -Uvh http://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm
    sudo yum install -y augeas git puppet-agent vim-enhanced --nogpgcheck
    # /opt/puppetlabs/bin/puppet module install puppet-logrotate --version 3.4.0
    # /opt/puppetlabs/bin/puppet module install puppetlabs-stdlib --version 5.2.0
    # /opt/puppetlabs/bin/puppet module install puppetlabs-mysql --version 10.0.0
    # /opt/puppetlabs/bin/puppet module install puppet-selinux --version 3.0.0
    # /opt/puppetlabs/bin/puppet module install herculesteam/augeasproviders_syslog --version 2.3.0
    sudo ln -s /vagrant/ /etc/puppetlabs/code/modules/rtpengine
    /opt/puppetlabs/bin/puppet apply /etc/puppetlabs/code/modules/rtpengine/tests/init.pp
  SHELL
end
