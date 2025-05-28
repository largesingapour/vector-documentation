---
description: >-
  The Telegram bot is still under development, so this section is not yet filled
  out.
---

# ⚙️ Setup & Configuration

Get your Vector GPT Telegram bot up and running in minutes with this comprehensive setup guide. Whether you're setting up personal portfolio tracking or configuring community management for your group, we'll walk you through every step.

## 🚀 **Quick Start Setup**

### Step 1: Add Vector Bot to Telegram
1. **Search for the Bot**: Open Telegram and search for `@VectorAIBot`
2. **Start the Conversation**: Click **Start** or send `/start` command
3. **Accept Permissions**: Allow the bot to send you messages and notifications

### Step 2: Connect Your Wallet
```
/start
/connect [your_wallet_address]
```
- **Important**: The bot never requests private keys or seed phrases
- **Security**: All connections are read-only for maximum safety
- **Multiple Wallets**: You can connect up to 10 addresses (Bronze+) or unlimited (Gold)

### Step 3: Verify Your Staking (Optional)
```
/verify [staking_contract_address]
```
- **Bronze Tier**: 100,000 VECTOR staked → Enhanced features
- **Silver Tier**: 1,000,000 VECTOR staked → Premium analytics
- **Gold Tier**: 10,000,000 VECTOR staked → Unlimited access

### Step 4: Configure Basic Settings
```
/settings
```
- Set your preferred timezone and currency display
- Choose notification frequency and alert types
- Configure privacy settings and data sharing preferences

## 🏠 **Personal Chat Configuration**

### Portfolio Tracking Setup
```
/portfolio add [wallet_address] [nickname]
/portfolio remove [nickname]
/portfolio list
```

**Example:**
```
/portfolio add 0x742d35Cc6416C40e68D1DE84A5F87e857C5BE03A "Main Wallet"
/portfolio add 0x123...def "Trading Wallet"
```

### Alert Configuration
```
/alerts price [token] [condition] [value]
/alerts whale [token] [min_amount]
/alerts portfolio [percentage_change]
```

**Examples:**
```
/alerts price ETH above 4000
/alerts whale VECTOR 1000000
/alerts portfolio -10%
```

### Trading Preferences
```
/preferences slippage [percentage]
/preferences gas [strategy]
/preferences chain [preferred_chain]
```

**Options:**
- **Slippage**: 0.1% to 5% (default: 0.5%)
- **Gas Strategy**: eco/standard/fast/priority
- **Preferred Chain**: ethereum/polygon/bsc/arbitrum

## 👥 **Group Chat Configuration**

### Adding Bot to Your Group
1. **Add to Group**: Invite `@VectorAIBot` to your Telegram group
2. **Grant Permissions**: Give the bot admin rights for moderation features
3. **Initialize Group**: Send `/setup` in the group chat
4. **Configure Settings**: Use `/groupsettings` to customize features

### Community Moderation Setup
```
/moderate enable
/moderate scam_detection [on/off]
/moderate spam_filter [level]
/moderate auto_delete [on/off]
```

**Moderation Levels:**
- **Low**: Basic scam detection only
- **Medium**: Scam + spam detection with warnings
- **High**: Aggressive filtering with auto-deletion
- **Custom**: Fine-tuned rules for your community

### Tipping System Configuration
```
/tipping enable
/tipping min_amount [amount]
/tipping max_amount [amount]
/tipping cooldown [seconds]
```

**Recommended Settings:**
- **Min Amount**: 1 VECTOR (prevents spam)
- **Max Amount**: 10,000 VECTOR (security limit)
- **Cooldown**: 60 seconds (prevents abuse)

### Bounty System Setup
```
/bounty config min_bounty [amount]
/bounty config max_bounty [amount]
/bounty config admin_approval [on/off]
```

## 🔧 **Advanced Configuration**

### Custom Commands
Create shortcuts for frequently used operations:
```
/custom add [shortcut] [command]
/custom remove [shortcut]
/custom list
```

**Examples:**
```
/custom add "mybal" "/balance 0x742d35Cc6416C40e68D1DE84A5F87e857C5BE03A"
/custom add "ethprice" "/price ETH"
```

### API Integration (Silver+ Tier)
Connect external services and tools:
```
/api connect [service_name] [api_key]
/api disconnect [service_name]
/api status
```

**Supported Services:**
- **Discord**: Cross-platform notifications
- **Slack**: Team collaboration integration
- **Webhook URLs**: Custom endpoint notifications
- **Email**: Traditional notification backup

### Multi-Chain Configuration
```
/chains enable [chain_name]
/chains disable [chain_name]
/chains default [chain_name]
/chains list
```

**Supported Chains:**
- **Ethereum**: ethereum, eth
- **Polygon**: polygon, matic
- **BSC**: bsc, binance
- **Arbitrum**: arbitrum, arb
- **Optimism**: optimism, op

## 🔒 **Security Configuration**

### Privacy Settings
```
/privacy public_portfolio [on/off]
/privacy share_analytics [on/off]
/privacy data_retention [days]
```

**Recommended Privacy Settings:**
- **Public Portfolio**: OFF (keep your holdings private)
- **Share Analytics**: ON (helps improve the service)
- **Data Retention**: 30 days (balance between utility and privacy)

### Security Alerts
```
/security enable_2fa
/security notification_email [email]
/security suspicious_activity [on/off]
```

### Transaction Safety
```
/safety simulation [always/high_value/never]
/safety confirmation [always/high_value/never]
/safety max_gas [gwei_limit]
```

## 📊 **Notification Management**

### Alert Types
```
/notifications price_alerts [on/off]
/notifications whale_alerts [on/off]
/notifications portfolio_alerts [on/off]
/notifications security_alerts [on/off]
/notifications market_updates [on/off]
```

### Frequency Settings
```
/frequency price_checks [minutes]
/frequency portfolio_updates [hours]
/frequency market_summary [daily/weekly]
```

### Quiet Hours
```
/quiet set [start_time] [end_time] [timezone]
/quiet disable
```

**Example:**
```
/quiet set 22:00 08:00 UTC
```

## 🎛️ **Command Reference**

### Setup Commands
- `/start` - Initialize bot and show welcome message
- `/connect [address]` - Link wallet address to your account
- `/verify [contract]` - Verify staking status for premium features
- `/settings` - Open configuration menu

### Configuration Commands
- `/portfolio` - Manage tracked wallet addresses
- `/alerts` - Configure price and activity notifications
- `/preferences` - Set trading and display preferences
- `/moderate` - Configure group moderation settings (groups only)

### Advanced Commands
- `/custom` - Create custom command shortcuts
- `/api` - Manage external service integrations
- `/chains` - Configure multi-chain settings
- `/privacy` - Manage data sharing and privacy settings

## ❓ **Troubleshooting**

### Common Issues

**Bot Not Responding**
- Check if bot is online: `/status`
- Restart conversation: `/start`
- Clear cache: `/reset`

**Wallet Connection Failed**
- Verify address format (must be valid EVM address)
- Check network connectivity
- Ensure wallet has public transaction history

**Staking Not Recognized**
- Wait 5-10 minutes for blockchain confirmation
- Verify staking contract address
- Check minimum staking requirements

**Alerts Not Working**
- Verify notification settings: `/notifications`
- Check quiet hours configuration: `/quiet`
- Ensure sufficient VECTOR balance for premium features

### Getting Help
- **Community Support**: Join [@VectorAISupport](https://t.me/vectorai_tg)
- **Documentation**: Full guides at [vector-ai.pro](https://vector-ai.pro)
- **Direct Support**: Send `/support [your_issue]` for direct assistance
- **Email**: team@vector-ai.pro

---

**🎯 Pro Tips:**
- Start with basic portfolio tracking before enabling advanced features
- Test all settings in a private chat before configuring group features
- Regular backup of your custom commands and settings using `/export`
- Use `/help [command]` for detailed information about any specific command

---

## 🌐 **Official Links**

- **🌐 Website**: https://vector-ai.pro
- **🐦 Twitter/X**: https://x.com/vectorai_x
- **💬 Telegram**: https://t.me/vectorai_tg
- **📧 Email**: team@vector-ai.pro
