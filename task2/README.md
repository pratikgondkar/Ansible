
# Assignment 02

- Install nginx in your servers(more then 2) and make sure the log files of nginx should not be granted more than 1 GB space on the nodes
- Create equal number of websites as per your team  members and every members website should be hosted for only 2 hours and after every 2 hours another website should start displaying.
- First 2 hours <team>.opstree.com should display content of tanya website
- Next 2 hours <team>.opstree.com should display content of Heena website

- Install Apache
- Also Configure nginx to run as reverse proxy to apache after completing first point individually.


- Run the ansible commands in such a way that workers nodes are updated one by one and not altogether and also make sure using all type of strategies.



## Module Used

[![Group Module](https://img.shields.io/badge/Apt-green.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html)
[![User Module](https://img.shields.io/badge/Commad-red.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/command_module.html)
[![File Module](https://img.shields.io/badge/File-blue.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/file_module.html)
[![Shell Module](https://img.shields.io/badge/Shell-orange.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/shell_module.html)
[![Shell Module](https://img.shields.io/badge/Template-yellow.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/template_module.html)
[![Shell Module](https://img.shields.io/badge/Copy-pink.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/copy_module.html)
[![Shell Module](https://img.shields.io/badge/Cron-purple.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/cron_module.html)
[![Shell Module](https://img.shields.io/badge/Service-brown.svg)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/service_module.html)
## Step1

### Install Nginx Webserver

```
ansible server3 -i ansible-inventry -m apt -a "name=nginx state=present update_cache=yes" -b
```
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/8ee862be-9db6-43bb-99e0-0542a903b55d)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/865ad835-a43e-41bf-b0e1-ef7f86d71763)

## Step2

### Create directory for our website

Here I create a directory in which multiple website is located. Commands to create directory listed below...



```
ansible server3 -i ansible-inventry -b -m file -a "path=/var/www/website state=directory"

ansible server3 -i ansible-inventry -b -m command -a "mkdir /var/www/website/site1 /var/www/website/site2 /var/www/website/site3"
```


![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/edd363dc-3af3-49ff-8903-0f14c677ac4e)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/6fb869b2-d1e1-4255-a9e6-9b42b3bc6e18)

## Step3

### Create website inside each directory

```
ansible server3 -i ansible-inventry -b -m shell -a "echo 'This is Nikhil website' > /var/www/website/site1/index.html"

ansible server3 -i ansible-inventry -b -m shell -a "echo 'This is Ajay website' > /var/www/website/site2/index.html"

ansible server3 -i ansible-inventry -b -m shell -a "echo 'This is Jayanth website' > /var/www/website/site3/index.html"

ansible server3 -i ansible-inventry -b -m command -a "ln -s /var/www/website/site1 /var/www/html"
```
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/1d08cfab-2d15-41c3-bd8f-c4dbf452c9b4)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/6704b4f5-b0b2-44f6-b8b3-cfcd9a408c15)


## Step4
### Create website's configuration

```
ansible server3 -i ansible-inventry -b -m template -a "src=nginx_nikhil.conf.j2 dest=/etc/nginx/sites-available/nikhil"

ansible server3 -i ansible-inventry -b -m template -a "src=nginx_ajay.conf.j2 dest=/etc/nginx/sites-available/ajay"

ansible server3 -i ansible-inventry -b -m template -a "src=nginx_jayanth.conf.j2 dest=/etc/nginx/sites-available/jayanth"
```
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/a5a9792d-7321-4dc8-b2ce-cf443f1b75e6)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/cae8fdb0-3b3e-4500-a504-189009e89f51)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/59505051-5d55-48e2-82eb-02a94ce5ba64)

## Step5

### Create symlink to sites-enabled

```
ansible server3 -i ansible-inventry -b -m command -a "ln -s /etc/nginx/sites-available/nikhil /etc/nginx/sites-enabled"

ansible server3 -i ansible-inventry -b -m command -a "ln -s /etc/nginx/sites-available/ajay /etc/nginx/sites-enabled"

ansible server3 -i ansible-inventry -b -m command -a "ln -s /etc/nginx/sites-available/jayanth /etc/nginx/sites-enabled"
```
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/e8278c45-a5ea-4650-9304-f63094943c68)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/f905a076-5f6d-4496-a9a3-e3e4c145d75a)


## Step6

### Copy my script to remote server and give execute permission to it.
This "rotate_website.sh" script will rotate the website content every 2 min.
```
ansible server3 -i ansible-inventry -b -m copy -a "src=/home/opstree/codekiran/rotate_website.sh dest=/home/ubuntu"

ansible server3 -i ansible-inventry -b -m command -a "chmod +x /home/ubuntu/rotate_website.sh"
```
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/d8cb336a-3337-4063-9c31-8e14a8af5eff)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/255ac8b1-3bca-471b-89ef-95c2c6caf3a2)

## step7

### Setup the cron to run the rotate_website.sh script content 

```
ansible server3 -i ansible-inventry -b -m cron -a "name=run_script minute='*/2' job='/bin/bash /home/ubuntu/rotate_website.sh'"
```
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/18cf6415-59ea-43dc-804a-51061ce18a29)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/20410843-7828-4cbf-8e17-097a805d453b)

![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/f72e7786-e07b-4229-9d39-6bf7f62b92c8)

## Task8

### Restart Nginx Service

```
ansible server3 -i ansible-inventry -b -m service -a "name=nginx state=restarted"
```
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/e69ad31e-dac2-47f3-9929-5c96a52c7974)

# Output Result
## Website1 = Nikhil
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/319e399b-3a74-45f8-9a5a-5a1a6f9b6751)
## Website2 = Ajay
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/f585b8ab-7cf0-44e7-b2c2-c604a78ff6a4)
## Website3 = Jayanth
![App Screenshot](https://github.com/Kiran-dehlikar/test/assets/104997588/3d5b8bea-07c4-43c2-9fdd-70089a62a838)

