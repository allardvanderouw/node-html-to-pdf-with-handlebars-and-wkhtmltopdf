PORT = 3000

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "node-wkhtmltopdf"
    vb.memory = 1024
    vb.customize ["modifyvm", :id, "--uartmode1", "disconnected"]
  end

  config.vm.hostname = "node-wkhtmltopdf"

  config.vm.provision "shell", path: "vagrant-manifests/setup.sh", env: {
    "PORT" => PORT,
    "PDF_COMMAND" => "xvfb-run wkhtmltopdf"
  }

  config.vm.network "forwarded_port", guest: PORT, host: PORT
end
