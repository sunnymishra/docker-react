FROM node:alpine

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

CMD ["npm","run","start"]




FROM nginx

COPY --from=0 /app/build /usr/share/nginx/html