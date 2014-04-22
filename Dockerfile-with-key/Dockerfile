FROM piraticz/graph

ENV HOME /root

CMD ["/sbin/my_init"]

ADD ssh_key.pub /tmp/ssh_key.pub
RUN cat /tmp/ssh_key.pub >> /root/.ssh/authorized_keys && rm -f /tmp/ssh_key.pub
