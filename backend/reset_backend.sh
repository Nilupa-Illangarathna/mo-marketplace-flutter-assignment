#!/usr/bin/env bash

echo "Resetting backend..."
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo "Stopping server"
pkill -f "node src/server.js" || true
echo "Removing SQLite database..."
rm -f data/mo-marketplace.db
echo "Removing node_modules"
rm -rf node_modules
echo "Removing SQLite database"
rm -f data/mo-marketplace.db
echo "Removing npm cache"
npm cache clean --force
echo "Backend fully reset"
