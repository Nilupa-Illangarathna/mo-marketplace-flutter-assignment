#!/usr/bin/env bash

echo "Backend Bootstrapping..."
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"
echo "Installing dependencies..."
npm install
echo "Running database migration..."
npm run migrate
echo "Starting backend server..."
npm start
