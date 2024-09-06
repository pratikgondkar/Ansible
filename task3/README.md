
# Assignment 03

- Setup an entire infra using ansible playbook on aws
- Setup Spring3HibernateApp (https://github.com/opstree/spring3hibernate) on created infra using ansible playbook by following the below steps:
- Install MySQL
- Create the war file for Spring3HibernateApp using maven
- Install JDK 11
- Install Tomcat
- Send the war file created earlier to path "/opt/tomcat/apache-tomcat-7.0.108/webapps/"
- Restart tomcat service



## Module's  Used in playbook
- aws_infra.yml playbook

[![ec2_security_group Module](https://img.shields.io/badge/ec2_security_group-green.svg)](https://docs.ansible.com/ansible/latest/collections/amazon/aws/ec2_security_group_module.html) 
[![ec2_key Module](https://img.shields.io/badge/ec2_key-red.svg)](https://docs.ansible.com/ansible/latest/collections/amazon/aws/ec2_key_module.html)
[![ec2_instance Module](https://img.shields.io/badge/ec2_instance-blue.svg)](https://docs.ansible.com/ansible/latest/collections/amazon/aws/ec2_instance_module.html)
[![Debug Module](https://img.shields.io/badge/ec2_instance-yellow.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/debug_module.html)

- application.yml playbook

[![APT Module](https://img.shields.io/badge/Apt-green.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html)
[![File Module](https://img.shields.io/badge/File-blue.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/file_module.html)
[![COMMAND Module](https://img.shields.io/badge/Commad-red.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/command_module.html)
[![LineInFile Module](https://img.shields.io/badge/LineInFile-grey.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/lineinfile_module.html)
[![Git Module](https://img.shields.io/badge/git-violet.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/git_module.html)
# Step-1

## Creation of AWS infra 

### Before
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/482bd5b5-ecc7-46a5-aac6-6abbed33e66f)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/6855abda-14cd-44b7-838b-9815ee8ed76d)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/df5fc7ae-7e55-445c-9524-b571dbb7ecdf)

```
 ansible-playbook  aws_infra.yml --ask-vault-pass 
```
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/aceb2ea7-2e4a-469c-947e-f085ad03a9b6)

### After 
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/5002d621-0202-461c-8aa5-e2fab102901e)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/5264fb72-b996-4225-aaa7-cb93f8362a0a)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/a3e23bb0-7ade-405c-a818-1d660358faed)

# Step-2
## Update inventry file 

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/5ebe5975-0f4b-4576-a856-ac3c0d595a9d)

# Step-3

## Deployment of Spring3HibernateApp using application.yml playbook

In this playbook I install the following pakages
- mysql-server
- openjdk-11-jdk
- maven
- tomcat9
- tomcat9-admin

After cloning the repo (https://github.com/opstree/spring3hibernate.git)
Generate the war file and deploy the Spring3HibernateApp application shown in below screenshots......

```
ansible-playbook -i ansible-inventry application.yml
```
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/a3e5d306-a682-4d58-9fa8-e0009dc409d9)

# Step-4
## Verify Tomcat Manager and application page
### Tomcat manager page
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/5bd4de8c-b2a1-428a-8db2-99c9361b4078)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/b4787c99-f5db-46a7-8dde-3d085ed241bf)

### Tomcat Webapp page
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/5ed2b9a6-6f7f-4e03-9b3c-63baa44be4de)

## Authors

- [Kiran Dehlikar](https://github.com/Kiran-dehlikar)
