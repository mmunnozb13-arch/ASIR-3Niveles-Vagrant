Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 512
    vb.cpus = 1
  end

  config.vm.define "bbdd" do |m|
    m.vm.hostname = "MarcosMunozBarrosoBBDD"
    m.vm.network "private_network", ip: "192.168.20.10",
                 virtualbox__intnet: "red_datos"
    m.vm.provision "shell", path: "bbdd.sh"
    m.vm.provision "shell", name: "cortafuegos", path: "cortafuegos-bbdd.sh"
    m.vm.provision "shell", path: "sin_internet.sh", run: "always"
  end

  config.vm.define "web1" do |m|
    m.vm.hostname = "MarcosMunozBarrosoWeb1"
    m.vm.network "private_network", ip: "192.168.10.11",
                 virtualbox__intnet: "red_frontal"
    m.vm.network "private_network", ip: "192.168.20.11",
                 virtualbox__intnet: "red_datos"
    m.vm.provision "shell", path: "web.sh"
    m.vm.provision "shell", name: "cortafuegos", path: "cortafuegos-web.sh"
    m.vm.provision "shell", path: "sin_internet.sh", run: "always"
  end

  config.vm.define "web2" do |m|
    m.vm.hostname = "MarcosMunozBarrosoWeb2"
    m.vm.network "private_network", ip: "192.168.10.12",
                 virtualbox__intnet: "red_frontal"
    m.vm.network "private_network", ip: "192.168.20.12",
                 virtualbox__intnet: "red_datos"
    m.vm.provision "shell", path: "web.sh"
    m.vm.provision "shell", name: "cortafuegos", path: "cortafuegos-web.sh"
    m.vm.provision "shell", path: "sin_internet.sh", run: "always"
  end

  config.vm.define "balanceador" do |m|
    m.vm.hostname = "MarcosMunozBarrosoBalanceador"
    m.vm.network "forwarded_port", guest: 80, host: 8080
    m.vm.network "forwarded_port", guest: 443, host: 8443
    m.vm.network "private_network", ip: "192.168.10.10",
                 virtualbox__intnet: "red_frontal"
    m.vm.provision "shell", path: "balanceador.sh"
    m.vm.provision "shell", name: "cortafuegos", path: "cortafuegos-balanceador.sh"
  end
end
