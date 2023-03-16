FROM node:16
ARG env
# install dependencies
WORKDIR /app

COPY package.json ./
COPY package-lock.json ./
RUN npm install
COPY . ./

RUN npm run buildprod
EXPOSE 3000
CMD ["node", "./build"]