FROM node:12-alpine as base
WORKDIR /usr/src/app
COPY ./api/package*.json ./

FROM base as dev
RUN npm install
RUN npm install -g nodemon
COPY ./api .
EXPOSE 3000
LABEL dev="true"
CMD [ "nodemon", "./bin/www"]


FROM base as prod
RUN npm install --only=production
COPY ./api .
EXPOSE 3000
LABEL dev="false"
CMD [ "node", "./bin/www"]
