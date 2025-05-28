---
description: >-
  The Telegram bot is still under development, so this section is not yet filled
  out.
---

# 📋 Commands

Complete reference for all Vector GPT Telegram bot commands. Commands are organized by category with examples and usage notes.

## 🚀 **Essential Commands**

### Bot Control
```
/start
```
Initialize the bot and show welcome message. Use this when first adding the bot or if it stops responding.

```
/help [command]
```
Get help information. Use without parameters for general help, or specify a command for detailed instructions.
- **Examples**: `/help`, `/help tip`, `/help alerts`

```
/status
```
Check bot health, your account status, and current tier benefits.

```
/settings
```
Open the interactive settings menu to configure preferences, notifications, and privacy options.

```
/reset
```
Reset your bot configuration and clear cached data. Use if experiencing issues.

## 💰 **Financial Commands**

### Portfolio Management
```
/balance [address]
```
Check token and NFT balances for any wallet address.
- **Example**: `/balance 0x742d35Cc6416C40e68D1DE84A5F87e857C5BE03A`
- **Shortcut**: `/bal`

```
/portfolio [action] [parameters]
```
Manage your tracked wallet addresses:
- `/portfolio add [address] [nickname]` - Add wallet to tracking
- `/portfolio remove [nickname]` - Remove tracked wallet
- `/portfolio list` - Show all tracked wallets
- `/portfolio summary` - Get overview of all holdings

```
/price [symbol]
```
Get real-time price data and market information for any cryptocurrency.
- **Examples**: `/price ETH`, `/price VECTOR`, `/price BTC`
- **Features**: Shows price, 24h change, market cap, volume

```
/chart [symbol] [timeframe]
```
Display price charts for tokens (Premium feature).
- **Examples**: `/chart ETH 1d`, `/chart VECTOR 7d`
- **Timeframes**: 1h, 4h, 1d, 7d, 30d

### Crypto Tipping
```
/tip @username [amount] [message]
```
Send VECTOR tokens to another Telegram user.
- **Example**: `/tip @alice 100 "Thanks for the alpha!"`
- **Requirements**: Must have sufficient VECTOR balance
- **Limits**: 1-10,000 VECTOR per tip (configurable)

```
/tips
```
View your tipping history and statistics.

```
/claim
```
Claim any pending tips sent to you.

## 🔍 **Analysis Commands**

### Token & Contract Analysis
```
/analyze [token/contract_address]
```
Comprehensive security analysis of tokens or smart contracts.
- **Example**: `/analyze 0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984`
- **Features**: Security score, holder analysis, liquidity check

```
/contract [address]
```
Detailed smart contract information and function analysis.
- **Features**: Function list, verification status, proxy detection

```
/token [symbol/address]
```
Token-specific information including supply, holders, and trading data.
- **Example**: `/token VECTOR`

```
/risks [address]
```
Security assessment and risk scoring for contracts and tokens.

### Market Intelligence
```
/whales [token] [min_amount]
```
Track large wallet movements and whale activity.
- **Example**: `/whales VECTOR 1000000`
- **Features**: Recent large transactions, top holders

```
/trends [token] [timeframe]
```
Market sentiment and trend analysis.
- **Example**: `/trends ETH 24h`

```
/volume [token/pair]
```
Trading volume analysis across exchanges.

```
/liquidity [token/pair]
```
Liquidity pool analysis and health metrics.

## ⚡ **DeFi Commands**

### Trading Operations
```
/swap [from] [to] [amount]
```
Prepare token swap transactions with optimal routing.
- **Example**: `/swap ETH USDC 1.0`
- **Features**: Route optimization, slippage protection, gas estimation

```
/bridge [token] [amount] [to_chain]
```
Cross-chain asset transfer preparation.
- **Example**: `/bridge USDC 1000 polygon`

```
/wrap [amount]
```
Wrap/unwrap native tokens (ETH ↔ WETH).
- **Example**: `/wrap 0.5` (wraps 0.5 ETH to WETH)

### Yield Farming
```
/yield [token]
```
Find best yield farming opportunities for your tokens.
- **Example**: `/yield USDC`
- **Features**: APY comparison, risk assessment

```
/stake [token] [amount]
```
Prepare staking transactions for supported protocols.

```
/unstake [token] [amount]
```
Prepare unstaking transactions.

### Liquidity Provision
```
/addlp [token1] [token2] [amount1] [amount2]
```
Add liquidity to DEX pools.

```
/removelp [pair] [percentage]
```
Remove liquidity from pools.

## 🚨 **Alert Commands**

### Price Alerts
```
/alerts price [token] [condition] [value]
```
Set price-based alerts.
- **Examples**: 
  - `/alerts price ETH above 4000`
  - `/alerts price VECTOR below 0.10`
- **Conditions**: above, below, change

```
/alerts whale [token] [min_amount]
```
Get notified of large transactions.
- **Example**: `/alerts whale VECTOR 500000`

```
/alerts portfolio [percentage]
```
Portfolio value change notifications.
- **Example**: `/alerts portfolio -10%`

### Alert Management
```
/alerts list
```
Show all your active alerts.

```
/alerts remove [alert_id]
```
Remove specific alert.

```
/alerts pause
/alerts resume
```
Temporarily pause/resume all alerts.

## 👥 **Community Commands**

### Bounty System
```
/bounty create [amount] [description]
```
Create community bounties.
- **Example**: `/bounty create 1000 "Best trading strategy for Q1"`

```
/bounty list
```
View active bounties.

```
/bounty claim [bounty_id] [submission]
```
Submit work for a bounty.

```
/bounty vote [bounty_id] [submission_id]
```
Vote on bounty submissions (if voting enabled).

### Group Management (Admin Only)
```
/moderate [enable/disable]
```
Toggle moderation features.

```
/moderate config [setting] [value]
```
Configure moderation settings:
- `scam_detection on/off`
- `spam_filter low/medium/high`
- `auto_delete on/off`

```
/summary [timeframe]
```
Summarize chat activity and key points.
- **Examples**: `/summary 1h`, `/summary 24h`

```
/translate [message/reply]
```
Translate messages to group's default language.

```
/stats
```
Group engagement and activity statistics.

## 🔧 **Utility Commands**

### Information
```
/gas
```
Current gas prices across supported networks.

```
/chains
```
List supported blockchain networks and their status.

```
/news [keyword]
```
Latest crypto news and updates.
- **Example**: `/news DeFi`

### Conversion & Calculation
```
/convert [amount] [from] [to]
```
Convert between cryptocurrencies or fiat.
- **Example**: `/convert 100 USD ETH`

```
/calc [expression]
```
Basic calculator for trading calculations.
- **Example**: `/calc 1.5 * 2000` (calculate position size)

### Data Export (Premium)
```
/export portfolio [format]
```
Export portfolio data.
- **Formats**: csv, json, pdf

```
/export transactions [address] [timeframe]
```
Export transaction history.

## ⚙️ **Configuration Commands**

### Account Management
```
/connect [wallet_address]
```
Link wallet address to your account.

```
/disconnect [wallet_address]
```
Remove wallet from your account.

```
/verify [staking_contract]
```
Verify staking status for premium features.

### Preferences
```
/preferences [setting] [value]
```
Configure trading and display preferences:
- `currency USD/EUR/BTC/ETH`
- `timezone UTC/EST/PST/etc`
- `slippage 0.1-5.0`
- `gas_strategy eco/standard/fast`

### Notifications
```
/notifications [type] [on/off]
```
Control notification types:
- `price_alerts`
- `whale_alerts`
- `portfolio_alerts`
- `security_alerts`
- `market_updates`

```
/quiet [start_time] [end_time] [timezone]
```
Set quiet hours for notifications.
- **Example**: `/quiet 22:00 08:00 UTC`

## 🎛️ **Advanced Commands (Premium)**

### Custom Commands
```
/custom add [shortcut] [command]
```
Create command shortcuts.
- **Example**: `/custom add "mybal" "/balance 0x742d..."`

```
/custom remove [shortcut]
```
Remove custom command.

```
/custom list
```
List all custom commands.

### API Integration
```
/api connect [service] [api_key]
```
Connect external services (Discord, Slack, webhooks).

```
/api status
```
Check API integration status.

```
/webhook [url] [events]
```
Set up webhook notifications.

## 📚 **Help & Support**

### Getting Help
```
/help [command]
```
Detailed help for specific commands.

```
/support [message]
```
Contact support directly.

```
/feedback [message]
```
Send feedback about bot features.

```
/tutorial [topic]
```
Interactive tutorials for bot features.
- **Topics**: basics, trading, alerts, security

### Information
```
/about
```
Bot version and feature information.

```
/changelog
```
Recent updates and new features.

```
/roadmap
```
Upcoming features and development plans.

---

## 🏆 **Command Availability by Tier**

### Free Tier
- Basic portfolio tracking and price commands
- Limited alerts (5 active alerts)
- Basic analysis commands
- Community features

### Bronze Tier (100K VECTOR)
- Enhanced rate limits (1 command per 10 seconds)
- Advanced notifications
- Portfolio tracking (up to 10 wallets)
- Custom commands (up to 5)

### Silver Tier (1M VECTOR)
- Real-time alerts and advanced analytics
- API integrations
- Unlimited custom commands
- DeFi operation preparation

### Gold Tier (10M VECTOR)
- Unlimited access to all commands
- Priority execution
- Custom feature development
- Enterprise integrations

---

**💡 Quick Tips:**
- Use `/help [command]` for detailed information about any command
- Commands are case-insensitive and support abbreviations
- Most commands support both symbols and contract addresses
- Use `/custom` to create shortcuts for frequently used commands
