FROM node:14.17-alpine3.14

WORKDIR /app
COPY package*.json ./
# Install app dependencies
RUN apk update && apk upgrade && apk add git
RUN rm -rf node_modules package-lock.json && npm install --save firebase

COPY . /app
COPY plugins /app
RUN npm install

# Build app
RUN npm run build

ENV HOST 0.0.0.0
EXPOSE 3000

# start command
CMD [ "npm", "start" ]