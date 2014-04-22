FROM phusion/passenger-nodejs

ENV HOME /root

CMD ["/sbin/my_init"]

RUN /build/utilities.sh
RUN /build/nodejs.sh

#EXPOSE 80
#RUN rm -f /etc/service/nginx/down
#ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf

RUN npm install -g coffee-script mocha should
ADD rc.local /etc/rc.local

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
