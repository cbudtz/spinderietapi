FROM node:14-alpine

WORKDIR /srv

RUN apk add --no-cache python3 make g++

COPY ./package.json ./
COPY ./yarn.lock ./

RUN yarn install

COPY ./ .

ENV NODE_ENV=production

RUN yarn build

EXPOSE 1337

CMD ["yarn", "start"]
