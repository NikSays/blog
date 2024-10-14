FROM alpine:3.20 as hugo
RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community hugo

WORKDIR /blog
COPY . .
RUN hugo

FROM nginx:alpine
COPY ./nginx.conf /etc/nginx/nginx.conf

WORKDIR /var/www
COPY --from=hugo /blog/public .
