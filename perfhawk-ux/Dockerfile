ARG NODE_VERSION

# Base image containing node v24
FROM node:${NODE_VERSION}-alpine

# Run as root user
USER root

# Modify APK repositories configuration to use http instead of https
RUN sed -i 's/https/http/' /etc/apk/repositories

# Add Python3
RUN apk add --no-cache python3 py3-pip

# Create working directory
RUN mkdir /app
COPY . /app

# Disable SSL/TLS validation
ENV NODE_TLS_REJECT_UNAUTHORIZED=0

# Set working directory
WORKDIR /app

# Install node modules globally
RUN npm config set strict-ssl=false \
    && npm install -g sqlite3@5.1.6 chromedriver@113.0.0

# Add git
RUN apk update
RUN apk upgrade
RUN apk search git
RUN apk add git

CMD ["git", "-v"]