
# Assignment 01

Ansible modules for User and Group Management


## Module Used

[![Group Module](https://img.shields.io/badge/Group-green.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/group_module.html)
[![User Module](https://img.shields.io/badge/User-red.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/user_module.html)
[![File Module](https://img.shields.io/badge/File-blue.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/file_module.html)
[![Shell Module](https://img.shields.io/badge/Shell-orange.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/shell_module.html)
## Task1

### Add NinjaTeam (Simulate Group) - e.g., team1

```
ansible server3 -i ansible-inventory -m group -a "name=team1" -b
```
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/e926cec6-3156-4c15-87c7-b7bce0ab7308)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/5349ad01-1c39-4ef7-9f91-fd599a8817ff)

## Task2

### Add a User (Simulate) under a team - e.g., Nitish added to team1

Ensure the following constraints are met:

A user should have read, write, execute access to the home directory.

All the users of the same team should have read and execute access to the home directory of fellow team members.

```
ansible server3 -i ansible-inventory -m user -a "name=nitish group=team1 shell=/bin/bash state=present" -b
ansible server3 -i ansible-inventory -m user -a "name=ritesh group=team1 shell=/bin/bash state=present" -b

```
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/9e7f87a2-9c53-42d7-8768-fe3c70653239)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/8021e2b0-d6c4-4dd7-88e2-b978567d3ebe)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/270841cd-4a22-4fda-bdf5-86f131d40944)

## Task3

### Create Shared Directories in Home Directory of Every User
Team: Same team members will have full access.

Ninja: All ninjas will have full access.
```
ansible server3 -i ansible-inventory -m file -a "path=/home/nitish/Team mode=g+rwx group=team1 state=directory" -b
ansible server3 -i ansible-inventory -m file -a "path=/home/ritesh/Team mode=g+rwx group=team1 state=directory" -b

ansible server3 -i ansible-inventory -m file -a "path=/home/nitish/Ninja mode=a+rwx state=directory" -b
ansible server3 -i ansible-inventory -m file -a "path=/home/ritesh/Ninja mode=a+rwx state=directory" -b

```
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/69de3a67-50e0-4ac5-bd58-6a9d2f42bfeb)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/a0714052-2859-4cb5-8a1a-ce151cd86ca3)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/0edf39cf-9cf9-425f-8f93-11fe37a76c35)

# Additional Features
## Task4
### Change user shell

```
ansible server3 -i ansible-inventory -m user -a "name=nitish shell=/bin/sh" -b
ansible server3 -i ansible-inventory -m user -a "name=ritesh shell=/bin/sh" -b
```
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/43acdf7d-0160-421c-be56-b10e2accdb15)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/448663db-b716-4019-939c-a395aacefcd0)

## Task5

### Change user password

```
ansible server3 -i ansible-inventory -m shell -a "usermod --password \$(openssl passwd -6 'redhat') nitish" -b
ansible server3 -i ansible-inventory -m user -a "name=nitish update_password=always password={{ newpassword|password_hash('sha512') }}" -b --extra-vars "newpassword=redhat"
```
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/2a6edc81-1496-4f24-9f65-4ba315e7981b)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/b67fdd44-206f-4f82-b2a0-ee1d8f080b72)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/9db35b5f-08c3-4850-a3b3-f15a37dfe1cb)

## Task6

### Delete user
```
ansible server3 -i ansible-inventory -m user -a "name=nitish remove=yes state=absent" -b
ansible server3 -i ansible-inventory -m user -a "name=ritesh remove=yes state=absent" -b
```
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/3c15093a-d2e0-488c-a67c-000f06fbf863)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/6bfe33c4-f372-4adf-b035-7b10c07ae3d2)

## Task7

### Delete Group

```
ansible server3 -i ansible-inventory -m group -a "name=team1 state=absent" -b
```
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/6697d777-6757-475f-a28f-def135c7a732)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/ef4900cf-c1a2-4e63-ae1e-1fee6fab9ad4)

## Task8

### List users or teams

```
ansible server3 -m shell -a "getent passwd"
ansible server3 -m shell -a "getent group"
```
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/307e0605-3cbd-4038-a548-a469a2154c01)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/a9054efe-5398-409c-98b5-c43e17253594)
## Authors

- [Kiran Dehlikar](https://github.com/Kiran-dehlikar)
