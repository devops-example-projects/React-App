FROM node as build
WORKDIR /app
COPY package*.json .
RUN npm install 
COPY . .
RUN npm run build

FROM ngnix
COPY --from=build /app/build /usr/share/nginx/html