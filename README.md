graph
=====

graph api docker container with installer


environment
===========

  In order to correctly match system user IDs, it is recommended to use user app with ID 9999 since it is running under this user in the container:
```
adduser --uid 9999 --disabled-password app
su app
cd ~
```

installation
============

You can choose to install by installer or you can clone main repo and setup your environment manually:


installer (recommended)
-----------------------

Run:
```\curl -sSL https://raw.githubusercontent.com/pirati-cz/graph/master/install.sh | bash -s /home/app/graph```


cloning
-------

Run:
```
git clone https://github.com/pirati-cz/graph.git /home/app/graph
cd /home/app/graph
./clone_repositories.sh       # clones additional repos
./generate_ssh_key.sh         # generates ssh key to be used for ssh into the container
```


running
=======

For normal operation run: ```./run-container.sh```

or if you have issues getting into the image, run the image with shell: ```./run-container-bash.sh``` (don't forget to run /sbin/my_init& && sh /etc/rc.local to initiate image properly)


ssh
===

Run: ```./ssh.sh```


inside
======

Repositories are mounted from host machine into /home/app.

You can ```cd /home/app/graph-common``` and run ```npm test```.

