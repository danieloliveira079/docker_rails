#!/usr/bin/env bash
rm -f /usr/src/app/tmp/pids/server.pid

gem install bundler && bundle install

rails server -b 0.0.0.0
