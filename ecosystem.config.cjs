module.exports = {
  apps: [
    {
      name: "zone-sms-bot",
      script: "npx",
      args: "tsx src/index.ts",
      instances: 1,
      autorestart: true,
      watch: false,
      max_memory_restart: "500M",
      env: {
        NODE_ENV: "production",
        PORT: "8080",
      },
      env_file: ".env",
      log_file: "./logs/combined.log",
      out_file: "./logs/out.log",
      err_file: "./logs/error.log",
      time: true,
    },
  ],
};
