# Vagrant helloworld nginx app

This repo houses a Vagrant driven puppetized nginx application that runs a generated script that produces a hello world html page. The vagrantfile and nginx.pp files are commented to explain the process and how the application functions.

## Requirements
- Vagrant
- Virtualbox

## File Tree
puppet -
    manifests -
        nginx.pp (Installs nginx, creates a basic helloworld html and runs on the service)
    modules -
        sudoers -
            files -
                sudoers (contains the sudo priv changes for vagrant user and admin group)
            manifest -
                init.pp (Manages the sudoers file)
Vagrantfile

## How to run
```bash
vagrant up
```

## Issues
Noticed a couple of issues related to Virtualbox not functioning as expected (timeouts and network adaptor issues) and all in all wasn't the happiest with this solution so instead went ahead an created a dockerize minikube python version of this task which worked as planned and can be found at: [AL-HelloWorld](https://github.com/leeclench/al-helloworld)

## License
[MIT](https://choosealicense.com/licenses/mit/)