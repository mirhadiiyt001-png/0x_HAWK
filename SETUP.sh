#!/bin/bash
set -e

echo "🚀 Zone SMS Monitor - Setup Script"
echo "===================================="

# Check Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found. Install from https://nodejs.org"
    exit 1
fi

echo "✓ Node.js $(node -v)"

# Install dependencies
echo ""
echo "📦 Installing dependencies..."
npm install
cd frontend && npm install && cd ..

echo ""
echo "✓ Dependencies installed"

# Show next steps
echo ""
echo "📋 Next Steps:"
echo ""
echo "1. Create .env file:"
echo "   cp .env.example .env"
echo ""
echo "2. Update .env with your values:"
echo "   RAILWAY_API_URL=https://your-api.up.railway.app/api/zone"
echo "   TELEGRAM_BOT_TOKEN=your-bot-token"
echo "   OWNER_CHAT_ID=your-chat-id"
echo "   DATABASE_URL=postgresql://localhost/zone_sms"
echo "   SESSION_SECRET=random-secret-key"
echo ""
echo "3. Create PostgreSQL database:"
echo "   createdb zone_sms"
echo ""
echo "4. Start development:"
echo "   npm run dev"
echo ""
echo "5. For Railway deployment:"
echo "   - Push to GitHub"
echo "   - Connect to Railway"
echo "   - See DEPLOYMENT.md for details"
echo ""
echo "✓ Setup ready!"
