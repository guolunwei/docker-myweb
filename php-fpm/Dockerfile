FROM myos:8.5
RUN dnf install -y php-fpm && dnf clean all && \
    mkdir -p /run/php-fpm && chown -R nobody.nobody /run/php-fpm /var/log/php-fpm && \
    sed -ri -e 's/^user.*/;&/' -e 's/^group.*/;&/' -e 's/(^listen = ).*/\1127.0.0.1:9000/' /etc/php-fpm.d/www.conf
USER nobody
EXPOSE 9000/tcp
CMD ["/usr/sbin/php-fpm", "--nodaemonize"]
