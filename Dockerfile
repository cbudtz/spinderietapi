FROM strapi/base:14-alpine

WORKDIR /srv

COPY ./package.json ./
COPY ./yarn.lock ./

RUN yarn install

COPY ./ .

ENV NODE_ENV production

RUN yarn build

EXPOSE 1337

CMD ["yarn", "start"]
