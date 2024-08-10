#!/bin/bash


cd ru-be

case "$1" in
  start)
    echo "Starting the backend server..."
    bundle exec thin start -p 4567 -e production
    ;;
  dev)
    echo "Starting the backend server in development mode..."
    bundle exec thin start -p 4567 -e development
    ;;
  install)
    echo "Installing dependencies..."
    bundle install --path vendor/bundle
    ;;
  update)
    echo "Updating dependencies..."
    bundle update
    ;;
  console)
    echo "Starting interactive console..."
    bundle exec irb -r ./app.rb
    ;;
  *)
    echo "Usage: $0 {start|dev|install|update|console}"
    exit 1
    ;;
esac