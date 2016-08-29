$prepare = <<BASH
curl -s http://tar.goaccess.io/goaccess-1.0.2.tar.gz | tar xvz
cd goaccess-1.0.2/
add-apt-repository -y ppa:maxmind/ppa
apt-get update
apt-get install -y build-essential autoconf libgeoip-dev libncursesw5-dev
./configure --enable-geoip --enable-utf8
make
make install
curl -s https://bootstrap.pypa.io/get-pip.py | python3
pip install awscli
BASH

Vagrant.configure(2) do |config|
   config.vm.box = "ubuntu/xenial64"
   config.vm.box = "ubuntu/trusty64"

   config.vm.provision "shell", inline: $prepare

   config.vm.network "forwarded_port", guest: 80, host: 8888

   config.vm.provider "virtualbox" do |v|
     v.name   = "goaccess"
     v.memory = 2048
   end
end
