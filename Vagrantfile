

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 3000, host: 9999
  config.vm.network :forwarded_port, guest: 4200, host: 4200
  config.vm.network :forwarded_port, guest: 3306, host: 1234
  config.vm.network :private_network, ip: "192.168.68.8"
  config.vm.hostname = "devops"

  config.vm.synced_folder "./","/var/www/html", :nfs => {:mount_options => ['dmode=777','fmode=777']}

  config.vm.provider "virtualbox" do |v|
    v.name = "devOps"
    v.memory = "3072"
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/", "1"]
  end

  config.vm.provision "shell" do |s|
    s.path = "provision/setup.sh"
  end

  config.vm.provision "shell", path:"./provision/appsetup.sh", privileged: false, run:"always"
end
