FROM myos:8.5
RUN dnf install -y httpd php && dnf clean all && \
    sed -ri -e 's/^Load.*/#&/' -e 's/^#(.*mod_mpm_prefork.so)$/\1/' /etc/httpd/conf.modules.d/00-mpm.conf
ENV LANG=C
ADD myweb.tar.gz /var/www/html
WORKDIR /var/www/html
EXPOSE 80/tcp
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
