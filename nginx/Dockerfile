FROM myos:8.5 as builder
ADD nginx-1.22.1.tar.gz /
WORKDIR /nginx-1.22.1
RUN dnf install -y openssl-devel pcre-devel gcc make && \
    ./configure --prefix=/usr/local/nginx --with-http_ssl_module && \
    make && make install
RUN echo 'Nginx is running!' > /usr/local/nginx/html/index.html

FROM myos:8.5
RUN dnf install -y openssl pcre && dnf clean all
COPY --from=builder /usr/local/nginx /usr/local/nginx
ENV PATH=$PATH:/usr/local/nginx/sbin
WORKDIR /usr/local/nginx/html
EXPOSE 80/tcp
CMD ["nginx", "-g", "daemon off;"]
