FROM node:14.17-alpine3.14

# Create app directory

WORKDIR /app

# Install app dependencies
RUN apk update && apk upgrade && apk add git
RUN rm -rf node_modules package-lock.json && npm install

COPY . /app
RUN npm install

# Build app
RUN npm run build

ENV HOST 0.0.0.0
EXPOSE 3000

# start command
CMD [ "npm", "start" ]
