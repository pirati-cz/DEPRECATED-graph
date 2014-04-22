graph
=====

graph api docker container with installer


environment
===========

  In order to correctly match system user IDs it is recommended to use user 'app' with UID 9999 since it is running under this user in the container:

```
adduser --uid 9999 --disabled-password app
su app
cd ~
```

prerequisities
==============

These have to be installed:
  * bash, awk, sed (used in installation script and helper scripts)
  * ssh client and ssh-keygen (to allow accessing the living container machine and to generate ssh key)
  * git (for cloning repositories and development)
  * docker (container platform)


installation
============

You can choose to install by installer or you can clone main repo and setup your environment manually:


installer (recommended)
-----------------------

```
\curl -sSL https://raw.githubusercontent.com/pirati-cz/graph/master/install.sh | bash -s /home/app/graph
```

or cloning
----------

```
git clone https://github.com/pirati-cz/graph.git /home/app/graph
cd /home/app/graph
./clone_repositories.sh       # clones additional repos
./generate_ssh_key.sh         # generates ssh key to be used for ssh into the container
```


running
=======

For normal operation run: ```./run-container.sh```

or if you have issues getting into the image run the image with shell to inspect: ```./run-container-bash.sh```

Don't forget to run ```/sbin/my_init& && sh /etc/rc.local``` to initiate machine properly if you run container with shell.


ssh
===

If you have generated key by installation script or by ```generate_ssh_key.sh``` you can run ```./ssh.sh``` to ssh to the container machine.

Or you can manually configure keys in $GRAPH_INSTALLATION_DIR/app/.ssh which is mounted into the container as /home/app/.ssh.
See ssh.sh for more details on how to ssh to the container.


inside
======

Repositories are mounted from host machine into the container as user app's home folder: /home/app.

You can ```cd /home/app/graph-common``` and run ```npm test``` for example.

