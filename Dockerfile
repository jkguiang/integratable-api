# Pull base image.
FROM ubuntu:14.04

# Install Node.js
RUN apt-get update
RUN apt-get install --yes curl
RUN curl --silent --location https://deb.nodesource.com/setup_10.x | sudo bash -
RUN apt-get install --yes nodejs
RUN apt-get install --yes build-essential

# Download Maxima
RUN apt-get install -y maxima

# Set up server
RUN mkdir /usr/src/server
WORKDIR /usr/src/server

# Add `/usr/src/server/node_modules/.bin` to $PATH
ENV PATH /usr/src/server/node_modules/.bin:$PATH

# Install and cache server dependencies
COPY package.json /usr/src/server/package.json
RUN npm install
RUN npm install react-scripts@1.1.1 -g

# Set up client
RUN mkdir /usr/src/server/client
WORKDIR /usr/src/server/client


# Add `/usr/src/server/client/node_modules/.bin` to $PATH
ENV PATH /usr/src/server/client/node_modules/.bin:$PATH

# Install and cache server dependencies
COPY client/package.json /usr/src/server/client/package.json
RUN npm install --silent
RUN npm install react-scripts@1.1.1 -g --silent


# Start server
WORKDIR /usr/src/server
CMD ["npm", "run", "dev"]
