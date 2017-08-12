FROM haproxy:1.6.4-alpine

ENV CONSUL_TEMPLATE_VERSION 0.15.0
ENV CONSUL_TEMPLATE_SHA b7561158d2074c3c68ff62ae6fc1eafe8db250894043382fb31f0c78150c513a

ADD https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip /tmp/consul-template.zip

RUN echo "${CONSUL_TEMPLATE_SHA}  /tmp/consul-template.zip" > /tmp/consul-template.sha256 \
  && sha256sum -c /tmp/consul-template.sha256 \
  && cd $ROOTFS/usr/local/bin \
  && unzip /tmp/consul-template.zip \
  && chmod +x $ROOTFS/usr/local/bin/consul-template \
  && rm /tmp/consul-template.zip

ADD files /

ENTRYPOINT ["ash", "/dockerrun"]
