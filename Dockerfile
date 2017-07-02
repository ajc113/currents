FROM ubuntu:14.04
LABEL Description="This is the default image for Rultor.com" Vendor="thefishing.network" Version="1.0" Maintainer="tannakartikey@gmail.com"
WORKDIR /tmp

ENV DEBIAN_FRONTEND=noninteractive

# UTF-8 locale
RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Basic Linux tools
RUN apt-get update
RUN apt-get install -y wget bcrypt curl
RUN apt-get install -y unzip zip
RUN apt-get install -y gnupg gnupg2
RUN apt-get install -y jq
RUN apt-get install -y bsdmainutils
RUN apt-get install -y libxml2-utils
RUN apt-get install -y build-essential
RUN apt-get install -y automake autoconf

# Git 2.0
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update
RUN apt-get install -y git git-core

# SSH Daemon
RUN apt-get install -y ssh && \
  mkdir /var/run/sshd && \
  chmod 0755 /var/run/sshd

#Postgres
RUN sudo apt-get install -y postgresql postgresql-contrib

# Note: The official Debian and Ubuntu images automatically ``apt-get clean``
# after each ``apt-get``

# Run the rest of the commands as the ``postgres`` user created by the ``postgres-9.3`` package when it was ``apt-get installed``
USER postgres

# Create a PostgreSQL role named ``docker`` with ``docker`` as the password and
# then create a database `docker` owned by the ``docker`` role.
# Note: here we use ``&&\`` to run commands one after the other - the ``\``
#       allows the RUN command to span multiple lines.
RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER currents WITH SUPERUSER PASSWORD 'currents';" &&\
    createdb -O currents currents_test

# Adjust PostgreSQL configuration so that remote connections to the
# database are possible.
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5432

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# Set the default command to run when starting the container
CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]
USER root
# Ruby
RUN apt-get update && apt-get install -y ruby-dev libmagic-dev=1:5.14-2ubuntu3.3 \
  zlib1g-dev=1:1.2.8.dfsg-1ubuntu1
RUN gpg2 --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.3.4"
RUN /bin/bash -l -c "gem update && gem install --no-ri --no-rdoc nokogiri:1.6.7.2 bundler:1.15.1 i18n:0.8.4"

# PHP
RUN apt-get install -y php5 php5-dev php-pear
RUN curl --silent --show-error https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN mkdir jsl && \
  wget --quiet http://www.javascriptlint.com/download/jsl-0.3.0-src.tar.gz && \
  tar xzf jsl-0.3.0-src.tar.gz && \
  cd jsl-0.3.0/src && \
  make -f Makefile.ref && \
  mv Linux_All_DBG.OBJ/jsl /usr/local/bin && \
  cd .. && \
  rm -rf jsl
# RUN pecl install xdebug-beta && \
#   echo "zend_extension=xdebug.so" > /etc/php5/cli/conf.d/xdebug.ini
# Java
RUN apt-get install -y default-jdk

# LaTeX
RUN apt-get install -y texlive-latex-base
RUN apt-get install -y texlive-fonts-recommended
RUN apt-get install -y texlive-latex-extra
RUN apt-get install -y xzdec
RUN tlmgr init-usertree

# PhantomJS
RUN apt-get install -y phantomjs

# S3cmd for AWS S3 integration
RUN apt-get install -y s3cmd

# NodeJS
RUN rm -rf /usr/lib/node_modules
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

# Maven
ENV MAVEN_VERSION 3.3.9
ENV M2_HOME "/usr/local/apache-maven/apache-maven-${MAVEN_VERSION}"
RUN wget --quiet "http://mirror.dkd.de/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz" && \
  mkdir -p /usr/local/apache-maven && \
  mv "apache-maven-${MAVEN_VERSION}-bin.tar.gz" /usr/local/apache-maven && \
  tar xzvf "/usr/local/apache-maven/apache-maven-${MAVEN_VERSION}-bin.tar.gz" -C /usr/local/apache-maven/ && \
  update-alternatives --install /usr/bin/mvn mvn "${M2_HOME}/bin/mvn" 1 && \
  update-alternatives --config mvn

# Warming it up a bit
RUN /bin/bash -l -c "gem install jekyll:3.4.3"
ENV MAVEN_OPTS "-Xms512m -Xmx2g"
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
COPY settings.xml /root/.m2/settings.xml
RUN git clone https://github.com/yegor256/rultor.git --depth=1
RUN cd rultor && \
  mvn clean install -DskipTests -Pqulice && \
  cd .. && \
  rm -rf rultor

# Clean up
RUN rm -rf /tmp/*
RUN rm -rf /root/.ssh

ENTRYPOINT ["/bin/bash", "-l", "-c"]
