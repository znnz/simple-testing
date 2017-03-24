Vagrant.configure(2) do |config|

  # Setup based box Ubuntu 64-bit
  config.vm.box = "ubuntu/trusty64"

  # Specify port forwarding
  # Our devpro angular 2 App is running @ port 4200
  config.vm.network :forwarded_port, guest: 80, host: 8080, host_ip: "127.0.0.1"
  config.vm.network :forwarded_port, guest: 4200, host: 4200, host_ip: "127.0.0.1"
  config.vm.network :forwarded_port, guest: 3306, host: 1234, host_ip: "127.0.0.1"

  # Specify private network @192.168.68.8
  config.vm.network :private_network, ip: "192.168.68.8"

  # Specify host name
  config.vm.hostname = "devops"
  # Specify synced_folder
  config.vm.synced_folder "./","/var/www/html", :nfs => {:mount_options => ['dmode=777','fmode=777']}

  # Specify Virtualbox and memory ( 3GB )
  config.vm.provider "virtualbox" do |v|
    v.name = "devOps"
    v.memory = "3072"
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/", "1"]
  end

  # Specify Initial installation provision
  config.vm.provision "shell" do |s|
    s.path = "provision/setup.sh"
  end

  # Specify Shell Script to run Angular App
  config.vm.provision "shell", path:"./provision/appsetup.sh", privileged: false, run:"always"
  
end
