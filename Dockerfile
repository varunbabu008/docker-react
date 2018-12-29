FROM node:alpine as builder
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY ./ ./
RUN ls
RUN pwd
CMD ["npm", "run" ,"build"] 

FROM nginx
EXPOSE 80
RUN pwd
COPY --from=builder ./app/build /usr/share/nginx/html 
