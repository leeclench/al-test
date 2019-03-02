# This is the test that will display what app is running on port 80
$testscript = <<-SCRIPT
echo Let's see what is running on Port 80...
netstat -napl | grep 80
SCRIPT

# Below is the vagrant script that provisions puppet via the to the Ubuntu box to build an autoscaled nginx helloworld app
Vagrant.configure("2") do |config|
    (1..3).each do |i|
        config.vm.define "altest_#{i}" do |altest|
            # Specifies the box in use
            altest.vm.box = "puppetlabs/ubuntu-14.04-64-nocm"
            # Specifies the virtualbox settings
            altest.vm.provider "virtualbox" do |v|
                v.name = "altest_#{i}"
                v.customize [
                    "modifyvm", :id,
                    "--name", "altest_#{i}",
                    "--memory", 512,
                    "--natdnshostresolver1", "on",
                    "--cpus", 1,
                ]
            end
            # Details the network config
            altest.vm.network "forwarded_port", guest: 80, host: 8080,
              auto_correct: true
            altest.vm.synced_folder "./", "/vagrant", :nfs => true, :mount_options => ['vers=3','noatime','actimeo=2', 'tcp', 'fsc']
            
            # Provisions the puppet and nginx elements
            altest.vm.provision "puppet" do |puppet|
              puppet.manifests_path = "puppet/manifests",
              puppet.module_path = "puppet/modules",
              # the below runs the nginx install and sudoers config
              puppet.manifest_file = "nginx.pp"
            end
        end
    end
  # the shell scrip runs the nginx listening test
  config.vm.provision "shell", inline: $testscript
end