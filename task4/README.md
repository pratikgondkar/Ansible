
# Assignment 04

I create a System manager ansible role (System_Manager) with below feature

- I should be able to manage softwares that needs to be installed
- I should be able to manage user's on the system
- I should be able to manage various git repository
- Various folder structures that should exist on a VM
Think of other system specific settings that you should manage



## Module's  used in this role

[![APT Module](https://img.shields.io/badge/Apt-green.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html)
[![User Module](https://img.shields.io/badge/User-brown.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/user_module.html)
[![File Module](https://img.shields.io/badge/File-blue.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/file_module.html)
[![Git Module](https://img.shields.io/badge/Git-yellow.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/git_module.html)



# Step-1
## Setup inventory file to run System_Manager role
Here in our case inventory file is "ansible-inventry"

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/228512f4-27d6-47e8-a697-dd71e2264b6f)

# Step-2

## Running System_Manager role

```
ansible-playbook -i ansible-inventry -b System_Manager/tests/system_manager.yml 
```
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/f8d6c27c-e3f8-4cbb-916f-29bbc4fe501f)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/61c37a0b-956e-4534-b439-fa61c204333d)

# Step-3
## Verify On Remote server

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/b14328f8-f9e3-470a-8b4b-d7a6fca12f2f)

