#!/bin/bash

export NAME=${NAME:-localhost}

mkdir -p /etc/ssl/nginx

if [[ -n $SSL_CERT ]] &&  [[ -n $SSL_KEY ]]; then
   echo "$SSL_CERT" > /etc/ssl/nginx/server.crt
   echo "$SSL_KEY" > /etc/ssl/nginx/server.key
fi

if [ -n $SSL_CLIENT ]; then
  echo "$SSL_CLIENT" > /etc/ssl/nginx/client.pem
fi

mo < /etc/nginx/sites-disabled/default > /etc/nginx/sites-available/default

/usr/sbin/nginx