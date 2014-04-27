# start from phusion nodejs image
FROM phusion/passenger-nodejs

# set correct HOME env
ENV HOME /root

# turn on nginx
RUN rm -f /etc/service/nginx/down

# set CMD
CMD ["/sbin/my_init"]

# build nodejs environment
RUN /build/utilities.sh
RUN /build/nodejs.sh

# install global Node packages
RUN npm install -g coffee-script mocha should

# add config files
ADD etc/nginx/sites-enabled/webapp.conf /etc/nginx/sites-enabled/webapp.conf
ADD etc/rc.local /etc/rc.local
ADD etc/ssh/sshd_config /etc/ssh/sshd_config

# allow user 'app' to login through ssh
RUN passwd -u app

# clean temporary files and cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#EXPOSE 80
