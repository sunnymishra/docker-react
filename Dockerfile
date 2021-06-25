FROM node:alpine

WORKDIR '/app'

# Sometimes AWS has a tough time with the '.' folder designation and prefers the long form ./
COPY package*.json ./

RUN npm install

COPY . .

CMD ["npm","run","start"]




FROM nginx

# this EXPOSE 80 is required since we deploy docker on Aws Beanstalk
EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html