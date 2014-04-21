graph
=====

graph api docker container with installer

installation
============

  download raw install.sh file:
  ```wget https://raw.githubusercontent.com/pirati-cz/graph/master/install.sh```

  and run it with arguments>
  ```./install.sh <installation directory> [ <ssh public key> ]```
  where ssh public key is the key you will use to ssh to running container machine

running
=======

  run: ```./run-container-with-key.sh```

ssh
===

  run: ```docker ps```
       find ID of your running container (first 3 digits are enough)
  run: ```docker inspect <CONTAINER ID> | grep IPAddress```
  run: ```ssh -i <ssh private key> root@<IPAddress>```

inside
======

  Repositories are mounted from host machine into /home/app.
  You can ```cd /home/app/graph-common``` and run ```npm test```.

