FROM centos:7

# FROM saltstack/centos-7-minimal

RUN useradd nagios

RUN groupadd nagcmd

RUN usermod -a -G nagcmd nagios

RUN yum install -y wget unzip

RUN yum -y install gcc make which gcc-c++ 

# RUN yum groupinstall -y "Development Tools"


# RUN mkdir -p /u01/home/app/nagios/

# RUN mkdir -p /u01/home/app/instaladores/

# WORKDIR /nagios-plugins

# RUN wget -q -S --header="accept-encoding: gzip" \
#     --no-check-certificate -O nagios-plugins-2.2.1.tar.gz \
#     "https://repo.dparadig.com:8443/share/proxy/alfresco-noauth/api/internal/shared/node/-lAqRkxdToCGmj5C6W7how/content/nagios-plugins-2.2.1.tar.gz?c=force&noCache=1585763330832&a=true"

# RUN tar -xzf nagios-plugins-2.2.1.tar.gz

# RUN  rm -rf nagios-plugins-2.2.1.tar.gz

# WORKDIR /nagios-plugins/nagios-plugins-2.2.1

# RUN ./configure --prefix=/u01/home/app/nagios/ --with-nagios-user=nagios --with-nagios-group=nagcmd

# #MOVER ARRIBA
# # RUN yum install -y make

# RUN make

# RUN make install

# WORKDIR ..

# RUN rm -rf nagios-plugins-2.2.1

# RUN chown -R nagios:nagcmd /u01/home/app/nagios

# RUN chmod -R 775 /u01/home/app/nagios

# WORKDIR /devtools

# RUN wget -q -S --header="accept-encoding: gzip" \
#     --no-check-certificate -O devtools.zip \
#     "https://repo.dparadig.com:8443/share/proxy/alfresco-noauth/api/internal/shared/node/irFatzAjS4CvyEgFIcYmYA/content/devtools.zip?c=force&noCache=1585764901947&a=true"

# RUN unzip devtools.zip

# RUN yum install -y *

# WORKDIR /net-snmp-5

# RUN wget -q -S --header="accept-encoding: gzip" \
#     --no-check-certificate -O net-snmp-5.7.3.tar.gz \
#     "https://repo.dparadig.com:8443/share/proxy/alfresco-noauth/api/internal/shared/node/a7Xss94GThS43OUA2HIlDw/content/net-snmp-5.7.3.tar.gz?c=force&noCache=1585765186369&a=true"

# RUN tar -xzf net-snmp-5.7.3.tar.gz

# RUN rm -rf net-snmp-5.7.3.tar.gz

# WORKDIR /net-snmp-5/net-snmp-5.7.3

# RUN ./configure --with-default-snmp-version='3' \
#     --with-sys-contact='administradoresmonitoreo' \
#     --with-sys-location='digitalocean' \
#     --with-logfile='/var/log/snmpd.log' \
#     --with-persistent-directory='/var/net-snmp'

# RUN mkdir -p /u01/home/app/nagios/var/net-snmp

# RUN make

# RUN make install

# WORKDIR ..

# RUN rm -rf net-snmp-5.7.3

# WORKDIR /net-snmp-v6.0.1

# RUN wget -q -S --header="accept-encoding: gzip" \
#     --no-check-certificate -O net-snmp-v6.0.1.tar.gz \
#     "https://repo.dparadig.com:8443/share/proxy/alfresco-noauth/api/internal/shared/node/wTdoDQCISie-FmaADIUk4Q/content/Net-SNMP-v6.0.1.tar.gz?c=force&noCache=1585767110202&a=true"

# RUN tar -xzf net-snmp-v6.0.1.tar.gz

# RUN rm -rf net-snmp-v6.0.1.tar.gz

# WORKDIR /net-snmp-v6.0.1/Net-SNMP-v6.0.1

# RUN perl Makefile.PL

# RUN make

# RUN make install

# WORKDIR ..

# RUN rm -rf Net-SNMP-v6.0.1

# WORKDIR /Tie-lxHash

# RUN wget -q -S --header="accept-encoding: gzip" \
#     --no-check-certificate -O Tie-IxHash-1.23.tar.gz \
#     "https://repo.dparadig.com:8443/share/proxy/alfresco-noauth/api/internal/shared/node/9IDaZ7MXS623PRTB7zRPhA/content/Tie-IxHash-1.23.tar.gz?c=force&noCache=1585767365159&a=true"

# RUN tar -xzf Tie-IxHash-1.23.tar.gz

# RUN rm -rf Tie-IxHash-1.23.tar.gz

# WORKDIR /Tie-lxHash/Tie-IxHash-1.23

# RUN perl Makefile.PL

# RUN make

# RUN make install

# WORKDIR ..

# RUN rm -rf /Tie-IxHash-1.23

# WORKDIR /modgearman

# RUN wget -q -S --header="accept-encoding: gzip" \
#     --no-check-certificate -O gearmand.zip \
#     "https://repo.dparadig.com:8443/share/proxy/alfresco-noauth/api/internal/shared/node/GLXCX-tyRZCZBBEvSkKqgA/content/gearmand.zip?c=force&noCache=1585767455003&a=true"

# RUN unzip gearmand.zip

# RUN rm -rf

# RUN  yum install -y boost-program-options-1.53.0-27.el7.x86_64.rpm \
#     gearmand-0.33-7.rhel7.x86_64.rpm \
#     gearmand-devel-0.33-7.rhel7.x86_64.rpm \
#     libevent-2.0.21-4.el7.x86_64.rpm \
#     libevent-devel-2.0.21-4.el7.x86_64.rpm \
#     mod_gearman-3.0.7-1.rhel7.x86_64.rpm \
#     mod_gearman-debuginfo-3.0.7-1.rhel7.x86_64.rpm 

# WORKDIR /

# RUN rm -rf /modgearman

# COPY worker.conf /etc/mod_gearman/

# RUN ln -s /usr/local/sbin/snmpd /usr/sbin/snmpd

# RUN echo "/usr/bin/mod_gearman_worker --config=/etc/mod_gearman/worker.conf -d" >> ~/.bashrc

# RUN echo "/usr/sbin/snmpd" >> ~/.bashrc

RUN yum install -y openssh-server openssh-clients passwd nano; yum clean all

# RUN mkdir /var/run/sshd
RUN mkdir -p ~/.ssh
COPY authorized_keys /root/.ssh/

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' 
RUN ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N '' 

EXPOSE 22

# RUN echo "/usr/sbin/sshd -D" >> ~/.bashrc

CMD [ "/usr/sbin/sshd", "-D" ,"-f","/etc/ssh/sshd_config" ]

# ENTRYPOINT ["/usr/sbin/init"]
