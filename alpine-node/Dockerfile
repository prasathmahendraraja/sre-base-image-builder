#FROM node:16-alpine

ARG NODE_VERSION=16
FROM node:${NODE_VERSION}-alpine

RUN apk update \
 && apk add --no-cache tzdata

ENV TZ=America/New_York