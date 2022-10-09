FROM nginx

COPY content /usr/share/nginx/html
COPY conf/nginx.conf /etc/nginx/

EXPOSE 8080

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
