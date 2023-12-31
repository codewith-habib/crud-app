FROM node:alpine as builder
WORKDIR /project
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /project/build /usr/share/nginx/html