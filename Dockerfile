From ubuntu:16.04
#RUN rm /etc/apt/sources.list
#ADD ./sources.list /etc/apt
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt-get upgrade \
&& apt-get install -y apache2 \
&& apt-get install -y php7.0 libapache2-mod-php7.0 php7.0-pspell php7.0-curl php7.0-gd php7.0-intl php7.0-mysql php7.0-xml php7.0-xmlrpc php7.0-ldap php7.0-zip \
&& apt-get install unzip
COPY ./moodle.zip /var/www/html
WORKDIR /var/www/html
RUN unzip moodle.zip \
&& mv moodle-MOODLE_34_STABLE moodle \
&& rm moodle.zip 
ADD ./start.sh /
RUN chmod 777 /start.sh \
&& chmod 777 /var/www \
&& chmod 777 /var/www/html/moodle
RUN apt-get install -y mysql-client mysql-server 
