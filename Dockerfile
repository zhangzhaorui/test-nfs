FROM registry.dataos.io/library/ruby:2.3.1-alpine

ADD redis-trib.rb  /usr/local/bin/redis-trib.rb

RUN gem install redis && chmod 755 /usr/local/bin/redis-trib.rb && \
sed -i '/yes_or_die.msg/a return if ENV["QUIET_MODE"] == "1"' /usr/local/bin/redis-trib.rb

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
