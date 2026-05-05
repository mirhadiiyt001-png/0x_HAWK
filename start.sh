#!/bin/bash
# Zone SMS Bot - Hostinger VPS Start Script

cd "$(dirname "$0")"

# Install dependencies if missing
if [ ! -d "node_modules" ]; then
    echo "Installing dependencies..."
    npm install
fi

# Create logs directory
mkdir -p logs

# Start with tsx (no build needed)
export NODE_ENV=production
npx tsx src/index.ts
