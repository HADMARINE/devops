# Uses Ubuntu 18.04
FROM ubuntu:18.04

LABEL maintainer="contact@hadmarine.com"

# ENV gitUser 
# ENV gitPass 
# ENV gitUrl

# Run Upgrades 
RUN apt-get -y update

# Install packages
RUN apt-get -y install curl gnupg
# RUN curl -sL https://deb.nodesource.com/setup_12.x
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get install -y build-essential yarn
RUN apt-get update

# Install Node packages
RUN npm install -g pm2


EXPOSE 80