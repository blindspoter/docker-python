FROM python:2.7.15-slim-jessie
MAINTAINER blindspoter <wqchenxjtu@163.com>

ADD sources.list.jessie.txt /etc/apt/sources.list

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    apt-transport-https \
    curl

RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
 && echo '\
deb https://deb.nodesource.com/node_10.x jessie main\n\
deb-src https://deb.nodesource.com/node_10.x jessie main\n\
' > /etc/apt/sources.list.d/nodesource.list \
 && echo '\
Package: nodejs\n\
Pin: origin deb.nodesource.com\n\
Pin-Priority: 900\n\
' > /etc/apt/preferences.d/nodesource \
  && curl -s https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

RUN apt-get update \
 && apt-get install -y --no-install-recommends --fix-missing \
    nodejs \
    yarn \
    make \
    git \
    netcat \
 && apt-get autoremove -y \
 && apt-get clean all

RUN pip install --no-cache-dir --no-binary --upgrade --force-reinstall pip setuptools virtualenv
