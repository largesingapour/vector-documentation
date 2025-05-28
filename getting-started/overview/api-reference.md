---
description: Not yet live in MVP Beta
---

# 🔧 Vector GPT API Reference

REST API for integrating Vector GPT's blockchain intelligence into your applications.

## 🚀 **Getting Started**

**Base URL**: `https://api.vector-ai.pro/v1`

**Authentication**: Include your API key in headers:
```http
Authorization: Bearer YOUR_API_KEY
Content-Type: application/json
```

**Get API Key**: Sign up at https://vector-ai.pro/api-keys

## 🔐 **Rate Limits**

| Tier | Staking Required | Daily Limit | Features |
|------|------------------|-------------|----------|
| **Free** | 0 VECTOR | 50 calls | Basic endpoints |
| **Bronze** | 100K VECTOR | 500 calls | Enhanced features |
| **Silver** | 1M VECTOR | 2,500 calls | Premium APIs |
| **Gold** | 10M VECTOR | Unlimited | All features |

## 🔍 **Core Endpoints**

### Contract Analysis
```bash
GET /analyze/contract/{address}
```
Returns contract security score, functions, and risk assessment.

### Wallet Analysis  
```bash
GET /analyze/wallet/{address}
```
Returns balances, transaction history, and portfolio data.

### Token Analysis
```bash
GET /analyze/token/{address_or_symbol}
```
Returns price, liquidity, holder data, and security metrics.

### Market Data
```bash
GET /market/price/{symbol}
GET /market/whales/{token}
```
Real-time prices and whale movement tracking.

## ⚡ **Transaction Endpoints**

### Prepare Transaction
```bash
POST /transaction/prepare
```
Prepares transactions with optimal gas and routing.

### Simulate Transaction
```bash
POST /transaction/simulate  
```
Tests transaction outcomes before execution.

## 🤖 **AI Endpoints**

### Natural Language Query
```bash
POST /ai/query
```
Ask questions in plain English, get AI-powered responses.

### Smart Insights
```bash
POST /ai/insights
```
AI-generated analysis for portfolios and market conditions.

## 📚 **SDKs**

### JavaScript
```bash
npm install @vectorai/sdk
```

```javascript
import { VectorAI } from '@vectorai/sdk';

const vectorai = new VectorAI({ apiKey: 'YOUR_API_KEY' });
const analysis = await vectorai.analyzeContract('0x...');
```

### Python
```bash
pip install vectorai-python
```

```python
from vectorai import VectorAI

client = VectorAI(api_key='YOUR_API_KEY')
token_data = client.analyze_token('VECTOR')
```

## 📋 **Error Codes**

- `INVALID_API_KEY` - Check your API key
- `RATE_LIMIT_EXCEEDED` - Upgrade tier or wait
- `INSUFFICIENT_TIER` - Stake more VECTOR tokens
- `INVALID_ADDRESS` - Check address format

## 📞 **Resources**

- **API Status**: https://status.vector-ai.pro
- **OpenAPI Spec**: https://api.vector-ai.pro/v1/openapi.json
- **Support**: team@vector-ai.pro

---

## 🌐 **Official Links**

- **🌐 Website**: https://vector-ai.pro
- **🐦 Twitter/X**: https://x.com/vectorai_x
- **💬 Telegram**: https://t.me/vectorai_tg
