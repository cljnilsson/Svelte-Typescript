FROM node:16
ARG env
# install dependencies
WORKDIR /app

COPY ./src .
COPY ./package.json .

RUN npm i

# Copy all local files into the image.
COPY . .

RUN npm run build

FROM node:16

WORKDIR /app
COPY --from=0 /app .
COPY . .

EXPOSE 3000

CMD ["node", "./build"]