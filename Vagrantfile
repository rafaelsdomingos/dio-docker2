# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
  "master" => {"memory" => "768", "cpu" => "1", "ip" => "220", "image" => "bento/ubuntu-22.04"},
  "node01" => {"memory" => "768", "cpu" => "1", "ip" => "221", "image" => "bento/ubuntu-22.04"}
  #"node02" => {"memory" => "768", "cpu" => "1", "ip" => "222", "image" => "bento/ubuntu-22.04"}
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}"
      machine.vm.network "public_network", ip: "172.30.161.#{conf["ip"]}"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        
      end

      machine.vm.provision "shell", path: "docker.sh"
      
      if "#{name}" == "master"
        machine.vm.provision "shell", path: "master.sh"
      else
        machine.vm.provision "shell", path: "worker.sh"
        machine.vm.provision "shell", path: "config-worker.sh", run: "always"
      end

    end

  end
end