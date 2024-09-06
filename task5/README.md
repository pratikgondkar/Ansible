# Assignment 05
# Tasks Requirements
Create a ansible role on the assigned tool with following features: 
- Should be able to install version specific 
- Should be OS independent 
- Configuration should be variablelized 
- Try using jinja template 
- It should include Templates for the configuration files with all the dynamic value that needs to be updated. 
- It should include handlers ,but not along with the task. 
- User should have the options to execute the role on centos or ubuntu or together on both.

## Use Case 
In this I used the ubuntu platform to install and deploy my HAProxy webserver on remote servers.

### Directory structure of role haproxy 
     haproxy
        ├── defaults
        │   └── main.yml
        ├── files
        ├── handlers
        │   └── main.yml
        ├── meta
        │   └── main.yml
        ├── README.md
        ├── tasks
        │   ├── haproxy.yml
        │   ├── main.yml
        │   └── nginx.yml
        ├── templates
        │   ├── haproxy.cfg.j2
        │   ├── website1.conf.j2
        │   ├── website1.html.j2
        │   ├── website2.conf.j2
        │   ├── website2.html.j2
        │   ├── website3.conf.j2
        │   └── website3.html.j2
        ├── tests
        │   ├── haproxy_setup.yml
        │   ├── inventory
        │   └── test.yml
        └── vars
            └── main.yml
    
        8 directories, 18 files

## Playbook Execution
$ ansible-playbook haproxy/tests/haproxy_setup.yml

## Output
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/df40fa04-4cc8-4c07-ba80-e804af7d3015)
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/1cc4bcae-764e-4377-98d7-6956d495681b)

### Website1 Output
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/e9015990-d66e-4002-8257-5832adb4084d)

### Website2 Output
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/e4441d0e-040f-4616-aa28-4c64ce4346ad)

### Website3 Output
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/482bc771-f3b9-4ecd-ac2b-76b01c1c314c)

## HAProxy Output 
In the below screenshots you will see the request tranfer to multiple website for distribution of traffic
which act as a load balancer on the same url.

In the cofiguration file of HAProxy I mention to listen it on port 8080.
On every refresh of page it shows request transfer to the another website and so on.

### Website1 
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/6c143c63-e0d7-47ac-bc0a-b63aa3ce2f4d)

### Website2 
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/0a506d89-d02c-4f98-a45a-e1afa7f79951)

### Website3
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/74c53e78-a6b9-4f86-95a2-462d9a3049df)

## Monitoring
To monitor your frontend and backend HAProxy provides a Dashboard on port 8404 by default.
To open the Dashboard hit url " <ip_address>:8404/haproxy_stats " in browser.

![image](https://github.com/Kiran-dehlikar/test/assets/104997588/e08c191f-6f40-481e-8225-d0b377512d08)