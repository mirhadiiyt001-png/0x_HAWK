# Zone SMS Bot - Telegram Bot

Telegram bot for real-time SMS/OTP monitoring with auto-forwarding.

## Features

- Real-time SMS monitoring from Railway API
- Auto OTP detection & forwarding to Telegram
- Phone number status tracking (registered, unregistered, etc.)
- Express API with JSON file storage (no database needed)
- Easy Hostinger VPS deployment

## Setup

### 1. Environment Variables

Copy `.env.example` to `.env` and fill in:

```env
RAILWAY_API_URL=https://your-api.com/api/zone
TELEGRAM_BOT_TOKEN=your-bot-token
OWNER_CHAT_ID=your-telegram-id
NODE_ENV=production
PORT=8080
```

### 2. Install & Run

```bash
npm install
npm start
```

### 3. Hostinger VPS Deployment

```bash
# SSH into your VPS
git clone <repo-url>
cd zone-sms-bot
npm install

# Run directly
npm start

# Or with PM2 (recommended)
npm install -g pm2
pm2 start ecosystem.config.cjs
pm2 save
pm2 startup
```

## API Routes

| Method | Route | Description |
|--------|-------|-------------|
| GET | `/api/healthz` | Health check |
| GET | `/api/proxy/sms` | Fetch SMS data |
| GET | `/api/proxy/numbers` | Fetch phone numbers |
| GET | `/api/proxy/statuses` | Get phone statuses |
| POST | `/api/proxy/statuses` | Update phone status |
| GET | `/api/proxy/bot-info` | Bot info |
| POST | `/api/telegram-webhook` | Telegram webhook |

## Files

- `src/index.ts` — Main server entry
- `src/lib/telegram-bot.ts` — Telegram bot logic
- `src/lib/db.ts` — JSON file storage
- `ecosystem.config.cjs` — PM2 config
- `start.sh` — Linux start script
