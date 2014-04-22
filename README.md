graph
=====

graph api docker container with installer

installation
============

  ```\curl -sSL https://raw.githubusercontent.com/pirati-cz/graph/master/install.sh | bash -s <full installation directory path> <full ssh public key path>```

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

