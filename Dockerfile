FROM node:14-alpine
LABEL Author Gurpreet Singh <gurpreet.kainth1137@gmail.com>

# ISNTALL BASH FOR THIS IMAGE
RUN apk update && apk add bash

# You have to install the compiler and build dependencies in order to build bcrypt.
# https://github.com/kelektiv/node.bcrypt.js/wiki/Installation-Instructions
# RUN apk --no-cache add --virtual builds-deps build-base python

# CREATE WORK DIRECTORY
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# COPY THE PROJECT CODE TO WORK DIRECTORY
COPY . /usr/src/app

# COPY environment/.env.dev /usr/src/app/.env

# INSALL DEPENDENCIES
RUN npm install

# COMPILE CODE
RUN npm run build

# EXPOSE PORT
EXPOSE 3000

CMD [ "npm", "run", "start:prod" ]
