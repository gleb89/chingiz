FROM node:14.17-alpine3.14


WORKDIR /app
COPY package*.json ./

RUN apk update && apk upgrade && apk add git

COPY . /app


RUN npm run build

ENV HOST 0.0.0.0
EXPOSE 3000

CMD [ "npm", "start"]
