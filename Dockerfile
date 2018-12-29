FROM node:alpine as builder
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build 
RUN mkdir varun
RUN touch var

FROM nginx
EXPOSE 80
COPY --from=builder ./app/build /usr/share/nginx/html 
