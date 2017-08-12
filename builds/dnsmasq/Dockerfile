FROM alpine:3.4

EXPOSE 53 53/udp

RUN apk add --no-cache dnsmasq ca-certificates wget && \
	update-ca-certificates && \
	wget "http://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64" -O /usr/local/bin/dumb-init && \
	chmod +x /usr/local/bin/dumb-init

ADD files/dnsmasq.conf /etc/dnsmasq.conf

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]

CMD dnsmasq -k -C /etc/dnsmasq.conf --log-facility=-