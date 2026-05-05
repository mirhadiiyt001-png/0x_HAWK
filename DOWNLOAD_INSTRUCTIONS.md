# Download Instructions

## Download the Source Code

The complete Railway-ready source code is available in this directory.

### Option 1: Download from Replit (Recommended)
1. Go to **Files** panel (left sidebar)
2. Right-click on `zone-sms-railway` folder
3. Select **Download**
4. Extract the downloaded ZIP file

### Option 2: Clone from GitHub
```bash
git clone https://github.com/yourusername/zone-sms-monitor.git
cd zone-sms-monitor
```

### Option 3: Manual Copy
All files are visible in the file browser. Copy them directly to your machine.

## What You Get

```
zone-sms-railway/
├── src/                    # Backend (Node.js/Express)
├── frontend/               # Frontend (React/Vite)
├── package.json            # Root dependencies
├── Dockerfile              # Docker container config
├── railway.json            # Railway platform config
├── .env.example            # Environment template
├── SETUP.sh                # Local setup script
├── README.md               # Full documentation
├── DEPLOYMENT.md           # Railway deployment guide
└── QUICKSTART.md           # Quick reference
```

## Quick Start

### 1. Extract & Setup
```bash
tar -xzf zone-sms-railway.tar.gz  # or unzip if ZIP
cd zone-sms-railway
chmod +x SETUP.sh
./SETUP.sh
```

### 2. Configure
```bash
cp .env.example .env
# Edit .env with your values
```

### 3. Run Locally
```bash
npm run dev
```

### 4. Deploy to Railway
See **DEPLOYMENT.md** for complete instructions

## Environment Variables Needed

| Variable | Source |
|----------|--------|
| `TELEGRAM_BOT_TOKEN` | @BotFather on Telegram |
| `OWNER_CHAT_ID` | @userinfobot on Telegram |
| `RAILWAY_API_URL` | Your SMS API endpoint |
| `DATABASE_URL` | PostgreSQL connection |
| `SESSION_SECRET` | Generate: `node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"` |

## File Sizes

- Total: ~100 KB (without node_modules)
- Backend: 50 KB
- Frontend: 30 KB
- Configs & Docs: 20 KB

## Support

- Read **README.md** for features overview
- Read **DEPLOYMENT.md** for Railway setup
- Read **QUICKSTART.md** for quick reference

All documentation is included in the package.
