FROM fluentd:v1.9-1

USER root

RUN apk add --no-cache --virtual .build-deps \
        build-base \
        ruby-dev \
     && gem install \
        fluent-plugin-amqp:0.13.0 \
        fluent-plugin-s3:1.3.0 \
        fluent-plugin-cloudwatch-logs:0.9.4 \
     && gem sources --clear-all \
     && apk del .build-deps \
     && rm -rf /var/cache/apk/* \
               /tmp/* \
               /var/tmp/* \
               /usr/lib/ruby/gems/*/cache/*.gem \
       ;

USER fluent
