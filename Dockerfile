FROM phusion/passenger-nodejs

ENV HOME /root

CMD ["/sbin/my_init"]

RUN /build/utilities.sh
RUN /build/nodejs.sh

#EXPOSE 80
#RUN rm -f /etc/service/nginx/down
#ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD ssh_key.pub /tmp/ssh_key.pub
RUN cat /tmp/ssh_key.pub >> /root/.ssh/authorized_keys && rm -f /tmp/ssh_key.pub
