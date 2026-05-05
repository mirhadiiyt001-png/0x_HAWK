# Zone SMS Monitor - Railway Deployment

SMS monitoring dashboard with Telegram bot integration for OTP interception and number management.

## Features

- **SMS Monitoring**: Real-time SMS capture from Railway API
- **OTP Detection**: Automatic OTP extraction with premium emoji highlighting
- **Telegram Bot**: Forward SMS/OTP to Telegram with rotating button colors
- **Number Management**: Manage phone numbers with status tracking (registered, unregistered, already_other)
- **Device & Plan Info**: Track device type (from sender) and plan info (default: Weekly7)
- **Dashboard**: Clean web interface for SMS and number management

## Architecture

- **Backend**: Node.js/Express API server (port 8080)
- **Frontend**: React + Vite dashboard (built static, served by backend)
- **Database**: PostgreSQL for phone status persistence
- **Telegram**: Bot webhook mode for message forwarding

## Deployment on Railway

### Prerequisites
- Railway account
- PostgreSQL database (Railway provides)
- Telegram bot token (from @BotFather)
- Owner chat ID (your Telegram ID)

### Environment Variables

Required:
```
RAILWAY_API_URL=https://your-railway-api.up.railway.app/api/zone
TELEGRAM_BOT_TOKEN=123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11
OWNER_CHAT_ID=1234567890
DATABASE_URL=postgresql://user:pass@host:5432/dbname
SESSION_SECRET=your-secret-key
NODE_ENV=production
PORT=8080
```

### Deploy Steps

1. **Clone/Fork this repository to GitHub**

2. **Create Railway Project**
   - Go to railway.app
   - New Project → GitHub Repo

3. **Add PostgreSQL**
   - Add Service → PostgreSQL
   - Copy `DATABASE_URL` to project variables

4. **Set Environment Variables**
   ```
   RAILWAY_API_URL=https://your-upstream-api.com/api/zone
   TELEGRAM_BOT_TOKEN=your-token-here
   OWNER_CHAT_ID=your-id-here
   SESSION_SECRET=random-secret-key
   NODE_ENV=production
   ```

5. **Deploy**
   - Push to main branch
   - Railway auto-deploys
   - Dashboard available at your Railway domain

## Running Locally

```bash
# Install dependencies
npm install

# Set environment variables
export DATABASE_URL="postgresql://..."
export TELEGRAM_BOT_TOKEN="..."
export OWNER_CHAT_ID="..."
export RAILWAY_API_URL="https://..."

# Build frontend
npm run build:frontend

# Start server
npm start
```

## API Routes

- `GET /` — Dashboard (static files)
- `GET /api/proxy/sms` — Fetch SMS from Railway API
- `GET /api/proxy/numbers` — Fetch phone numbers
- `GET /api/proxy/statuses` — Get phone statuses from DB
- `POST /api/proxy/statuses` — Update phone status
- `GET /api/proxy/bot-info` — Get bot username
- `POST /api/telegram-webhook` — Telegram webhook endpoint
- `GET /api/health` — Health check

## Database Schema

```sql
CREATE TABLE phone_statuses (
  phone TEXT PRIMARY KEY,
  status TEXT NOT NULL,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);
```

Auto-created on startup via migrations.

## Telegram Bot Setup

1. Create bot with @BotFather on Telegram
2. Get bot token
3. Get your user ID (DM @userinfobot)
4. Set webhook URL: `https://your-railway-domain.com/api/telegram-webhook`
5. Bot forwards SMS and OTP to your chat with:
   - Premium emoji in message body
   - Plain emoji in buttons
   - Rotating button colors (primary/success/danger)
   - Quick access to OTP code copy

## SMS Message Format

From Railway API (6-column):
- Column 0: Timestamp
- Column 1: SIM name
- Column 2: Phone number
- Column 3: Sender/From
- Column 4: Message body
- Column 5: OTP flag (1/0)

Telegram displays:
- Phone number
- Time received
- SIM info
- Device (from sender)
- Plan (default: Weekly7)
- Message body (with premium emoji)
- OTP code (if detected)

## Caching

- SMS endpoint: 4s cache, 60s stale fallback
- Numbers endpoint: Same
- Prevents upstream rate limiting

## Status Values

- `not_tried` — Haven't tried registration
- `registered` — Successfully registered
- `unregistered` — Registration failed
- `already_other` — Number already registered elsewhere

## Support

For issues, check:
1. Environment variables set correctly
2. Railway API URL is accessible
3. PostgreSQL connection working
4. Telegram bot token valid
5. Webhook URL matches your Railway domain
