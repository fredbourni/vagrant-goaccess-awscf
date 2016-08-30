Vagrant.configure(2) do |config|

   config.vm.box = "ubuntu/trusty64"

   config.vm.provision "shell", path: "shell/bootstrap.sh"

   config.vm.network "forwarded_port", guest: 80, host: 80

   config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

   config.vm.provider "virtualbox" do |v|
     v.name   = "goaccess"
     v.memory = 2048
   end

end
