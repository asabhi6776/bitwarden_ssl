FROM nginx:latest
LABEL maintainer="asabhi6776"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install openssl -y

WORKDIR /root

COPY ./config/certs/ssl.conf /root/bitwarden_ssl.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout bitwarden_ssl.key -out bitwarden_ssl.crt -config bitwarden_ssl.conf

CMD ["nginx" "-g" "daemon off;"]