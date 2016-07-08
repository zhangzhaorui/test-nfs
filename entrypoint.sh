#!/bin/sh

if [ "$CLUSTER_CMD" = create ]; then
  if [ -f /usr/local/etc/redis-trib.conf ] ; then
    . /usr/local/etc/redis-trib.conf
    QUIET_MODE=1 redis-trib.rb create --replicas $REPLICAS $NODES
  fi
fi
