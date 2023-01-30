FROM ubuntu:latest

WORKDIR /app

COPY . /app

#RUN mkdir conf
#RUN mv httpd.conf conf/

RUN apt-get update
RUN apt-get install -y nginx 

EXPOSE 80

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

