#!/bin/bash

cd ru-fe

case "$1" in
  start)
    echo "Starting the frontend server in production mode..."
    npm run dev
    ;;
  build)
    echo "Building the frontend..."
    npm run build
    ;;
  preview)
    echo "Running preview of production build..."
    npm run preview
    ;;
  install)
    echo "Installing dependencies..."
    npm install
    ;;
  lint)
    echo "Running linter..."
    npm run lint
    ;;
  test)
    echo "Running tests..."
    npm run test
    ;;
  *)
    echo "Usage: $0 {start|dev|build|preview|install|lint|test}"
    exit 1
    ;;
esac