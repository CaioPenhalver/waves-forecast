FROM ruby:2.4.3
MAINTAINER Caio <cpenhalver@gmail.com>

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/msprod.list
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

RUN echo "deb http://ftp.debian.org/debian experimental main" >> /etc/apt/sources.list
RUN echo "deb http://ftp.debian.org/debian sid main" >> /etc/apt/sources.list
RUN apt-get update -qq
RUN apt-get install libc6 libstdc++6 unixodbc-dev -y --force-yes
RUN apt-get install -y --no-install-recommends vim nodejs postgresql-client locales

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
RUN export LC_ALL="en_US.utf8"

RUN curl -L -O https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN tar -jxvf phantomjs-2.1.1-linux-x86_64.tar.bz2 phantomjs-2.1.1-linux-x86_64/bin/phantomjs
RUN mv phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/
RUN rm phantomjs-2.1.1-linux-x86_64.tar.bz2 && rm -rf phantomjs-2.1.1-linux-x86_64/bin
RUN chmod 755 /usr/local/bin/phantomjs

RUN mkdir -p /bazille

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install
RUN gem install bundler-audit

WORKDIR /waves_forecast
ADD . /waves_forecast
