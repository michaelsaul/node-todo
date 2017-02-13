
FROM node:latest
MAINTAINER Michael Saul
LABEL Name=nodejsmeetup Version=0.0.1 
COPY package.json /tmp/package.json
RUN cd /tmp && npm install --production
RUN mkdir -p /usr/src/app && mv /tmp/node_modules /usr/src
WORKDIR /usr/src/app
COPY . /usr/src/app
EXPOSE 8080
CMD node server.js
