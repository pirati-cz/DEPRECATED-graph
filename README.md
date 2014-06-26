graph
=====

graph api docker container with installer


prerequisities
==============

These have to be installed:
  * bash, awk, sed (used in installation script and helper scripts)
  * ssh client and ssh-keygen (to allow accessing the living container machine and to generate ssh key)
  * git (for cloning repositories and development)
  * docker (container platform)


installation
============

```
\curl -sSL https://raw.githubusercontent.com/pirati-cz/graph/master/install.sh | bash -s /dir/to/install/graph
```


running
=======

For normal operation run: ```./run-container.sh```

or if you have issues getting into the image run the image with shell to inspect as root: ```./run-container bash```

Don't forget to run ```/sbin/my_init& && sh /etc/rc.local``` to initiate machine properly if you run container with shell.


ssh
===

If you have generated key by installation script or by ```generate_ssh_key.sh``` you can run ```./ssh.sh``` to ssh to the container machine.

See ssh.sh for more details on how to ssh to the container.


inside
======

Directory data is a volume mounted into MongoDB container for data persistence.

Directory app with repositories is a volume mounted into the container from its host machine as user app's home folder: /home/app.

You can ```cd /home/app/graph-common``` and run ```npm test``` for example.
