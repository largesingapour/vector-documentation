---
description: Not yet live in MVP Beta
---

# 🔧 Vector GPT API Reference

Complete API documentation for integrating Vector GPT's blockchain intelligence into your applications. Our REST API provides programmatic access to all Vector GPT capabilities including real-time blockchain analysis, transaction preparation, and AI-powered insights.

## 🚀 **Quick Start**

### Base URL
```
https://api.vectorai.pro/v1
```

### Authentication
All API requests require authentication using your Vector AI API key:

```bash
curl -H "Authorization: Bearer YOUR_API_KEY" \
     -H "Content-Type: application/json" \
     https://api.vectorai.pro/v1/analyze/contract/0x...
```

### Get Your API Key
1. **Stake VECTOR tokens** for your desired tier
2. **Visit**: https://vector-ai.pro/api-keys
3. **Generate** a new API key for your applications
4. **Configure** rate limits and permissions

## 🔐 **Authentication & Rate Limits**

### API Key Tiers

| Tier | Required Staking | Rate Limit | Features |
|------|------------------|------------|----------|
| **Bronze** | 100,000 VECTOR | 500 calls/day | Basic endpoints |
| **Silver** | 1,000,000 VECTOR | 2,500 calls/day | Premium data sources |
| **Gold** | 10,000,000 VECTOR | 25,000 calls/day | Unlimited access |

### Headers
```http
Authorization: Bearer YOUR_API_KEY
Content-Type: application/json
X-Chain-ID: ethereum (optional, defaults to ethereum)
```

### Error Responses
```json
{
  "error": {
    "code": "RATE_LIMIT_EXCEEDED",
    "message": "Rate limit exceeded for your tier",
    "details": {
      "limit": 500,
      "reset_time": "2024-01-01T12:00:00Z"
    }
  }
}
```

## 🔍 **Blockchain Analysis Endpoints**

### Contract Analysis
Analyze smart contracts for security, functionality, and risk assessment.

**Endpoint:** `GET /analyze/contract/{address}`

```bash
curl -H "Authorization: Bearer YOUR_API_KEY" \
     https://api.vectorai.pro/v1/analyze/contract/0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984
```

**Response:**
```json
{
  "address": "0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984",
  "name": "Uniswap",
  "symbol": "UNI",
  "type": "ERC20",
  "verified": true,
  "security_score": 95,
  "analysis": {
    "functions": [
      {
        "name": "transfer",
        "type": "public",
        "payable": false,
        "risk_level": "low"
      }
    ],
    "risks": [],
    "recommendations": [
      "Contract is verified and appears safe to interact with"
    ]
  },
  "metadata": {
    "total_supply": "1000000000000000000000000000",
    "decimals": 18,
    "holders": 425891
  }
}
```

### Wallet Analysis
Get comprehensive wallet information including balances, transaction history, and risk assessment.

**Endpoint:** `GET /analyze/wallet/{address}`

```bash
curl -H "Authorization: Bearer YOUR_API_KEY" \
     https://api.vectorai.pro/v1/analyze/wallet/0x742d35Cc6416C40e68D1DE84A5F87e857C5BE03A
```

**Response:**
```json
{
  "address": "0x742d35Cc6416C40e68D1DE84A5F87e857C5BE03A",
  "type": "EOA",
  "balances": {
    "native": {
      "symbol": "ETH",
      "balance": "5.234567890123456789",
      "usd_value": 12567.89
    },
    "tokens": [
      {
        "address": "0xa0b86a33e6776",
        "symbol": "USDC",
        "balance": "1000.000000",
        "usd_value": 1000.00
      }
    ],
    "nfts": [
      {
        "contract": "0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d",
        "collection": "Bored Ape Yacht Club",
        "token_id": "1234",
        "name": "Bored Ape #1234"
      }
    ]
  },
  "activity_summary": {
    "total_transactions": 1547,
    "first_transaction": "2021-05-15T10:30:00Z",
    "last_transaction": "2024-01-15T14:22:00Z",
    "transaction_volume_usd": 567890.12
  }
}
```

### Token Analysis
Analyze any ERC20 token for price, liquidity, holder distribution, and security.

**Endpoint:** `GET /analyze/token/{address_or_symbol}`

```bash
curl -H "Authorization: Bearer YOUR_API_KEY" \
     https://api.vectorai.pro/v1/analyze/token/VECTOR
```

## ⚡ **Transaction Endpoints**

### Prepare Transaction
Prepare transactions with optimal gas pricing and route analysis.

**Endpoint:** `POST /transaction/prepare`

```bash
curl -X POST \
     -H "Authorization: Bearer YOUR_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{
       "type": "swap",
       "from_token": "ETH",
       "to_token": "0xa0b86a33e6776",
       "amount": "1.0",
       "slippage": 0.5,
       "recipient": "0x742d35Cc6416C40e68D1DE84A5F87e857C5BE03A"
     }' \
     https://api.vectorai.pro/v1/transaction/prepare
```

**Response:**
```json
{
  "transaction": {
    "to": "0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D",
    "data": "0x791ac947...",
    "value": "1000000000000000000",
    "gas_limit": 200000,
    "gas_price": "20000000000"
  },
  "simulation": {
    "success": true,
    "gas_used": 187543,
    "expected_output": "999.845621",
    "price_impact": 0.02
  },
  "route": {
    "path": ["WETH", "USDC"],
    "exchanges": ["Uniswap V3"],
    "fees": ["0.05%"]
  }
}
```

### Simulate Transaction
Test transaction outcomes before execution.

**Endpoint:** `POST /transaction/simulate`

```bash
curl -X POST \
     -H "Authorization: Bearer YOUR_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{
       "from": "0x742d35Cc6416C40e68D1DE84A5F87e857C5BE03A",
       "to": "0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984",
       "data": "0xa9059cbb...",
       "value": "0"
     }' \
     https://api.vectorai.pro/v1/transaction/simulate
```

## 📊 **Market Data Endpoints**

### Real-time Prices
Get current prices and market data for any token.

**Endpoint:** `GET /market/price/{symbol_or_address}`

```bash
curl -H "Authorization: Bearer YOUR_API_KEY" \
     https://api.vectorai.pro/v1/market/price/ETH
```

**Response:**
```json
{
  "symbol": "ETH",
  "price_usd": 2345.67,
  "price_change_24h": 2.34,
  "market_cap": 282345678901,
  "volume_24h": 12345678901,
  "last_updated": "2024-01-15T14:30:00Z"
}
```

### Whale Tracking
Monitor large wallet movements and whale activity.

**Endpoint:** `GET /market/whales/{token}?min_amount={amount}`

```bash
curl -H "Authorization: Bearer YOUR_API_KEY" \
     https://api.vectorai.pro/v1/market/whales/VECTOR?min_amount=100000
```

## 🤖 **AI-Powered Endpoints**

### Natural Language Query
Ask questions in plain English and get AI-powered responses.

**Endpoint:** `POST /ai/query`

```bash
curl -X POST \
     -H "Authorization: Bearer YOUR_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{
       "query": "What are the risks of interacting with contract 0x1234...?",
       "context": {
         "user_address": "0x742d35Cc...",
         "chain": "ethereum"
       }
     }' \
     https://api.vectorai.pro/v1/ai/query
```

**Response:**
```json
{
  "response": "Based on my analysis, this contract appears to be a verified ERC20 token with the following risk factors...",
  "confidence": 0.92,
  "sources": ["contract_verification", "holder_analysis", "transaction_patterns"],
  "recommendations": [
    "Contract is verified and appears legitimate",
    "Consider starting with a small test transaction"
  ],
  "related_data": {
    "security_score": 85,
    "verification_status": true,
    "audit_reports": []
  }
}
```

### Smart Insights
Get AI-generated insights about wallets, tokens, or market conditions.

**Endpoint:** `POST /ai/insights`

```bash
curl -X POST \
     -H "Authorization: Bearer YOUR_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{
       "type": "portfolio_analysis",
       "address": "0x742d35Cc6416C40e68D1DE84A5F87e857C5BE03A"
     }' \
     https://api.vectorai.pro/v1/ai/insights
```

## 🔔 **Webhook Endpoints**

### Setup Webhooks
Configure real-time notifications for events you care about.

**Endpoint:** `POST /webhooks`

```bash
curl -X POST \
     -H "Authorization: Bearer YOUR_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{
       "url": "https://your-app.com/webhook",
       "events": ["whale_movement", "price_alert"],
       "filters": {
         "tokens": ["VECTOR", "ETH"],
         "min_amount_usd": 10000
       }
     }' \
     https://api.vectorai.pro/v1/webhooks
```

**Webhook Payload Example:**
```json
{
  "event": "whale_movement",
  "timestamp": "2024-01-15T14:30:00Z",
  "data": {
    "token": "VECTOR",
    "from": "0x1234...",
    "to": "0x5678...",
    "amount": "1000000",
    "usd_value": 50000,
    "transaction_hash": "0xabcd..."
  }
}
```

## 📚 **SDK Libraries**

### JavaScript/TypeScript
```bash
npm install @vectorai/sdk
```

```javascript
import { VectorAI } from '@vectorai/sdk';

const vectorai = new VectorAI({
  apiKey: 'YOUR_API_KEY',
  chain: 'ethereum'
});

// Analyze a contract
const analysis = await vectorai.analyzeContract('0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984');
console.log(analysis.security_score);

// Get wallet balances
const wallet = await vectorai.getWallet('0x742d35Cc6416C40e68D1DE84A5F87e857C5BE03A');
console.log(wallet.balances.native.balance);
```

### Python
```bash
pip install vectorai-python
```

```python
from vectorai import VectorAI

client = VectorAI(api_key='YOUR_API_KEY')

# Analyze token
token_data = client.analyze_token('VECTOR')
print(f"Security Score: {token_data.security_score}")

# Prepare swap transaction
tx = client.prepare_swap(
    from_token='ETH',
    to_token='USDC',
    amount='1.0',
    recipient='0x742d35Cc6416C40e68D1DE84A5F87e857C5BE03A'
)
print(f"Gas estimate: {tx.gas_limit}")
```

## 📋 **Error Codes**

| Code | Message | Description |
|------|---------|-------------|
| `INVALID_API_KEY` | Invalid or missing API key | Check your API key |
| `RATE_LIMIT_EXCEEDED` | Rate limit exceeded | Upgrade tier or wait |
| `INSUFFICIENT_TIER` | Feature requires higher tier | Stake more VECTOR tokens |
| `INVALID_ADDRESS` | Invalid wallet/contract address | Check address format |
| `NETWORK_ERROR` | Blockchain network unavailable | Try again later |
| `SIMULATION_FAILED` | Transaction simulation failed | Check parameters |

## 🔧 **Advanced Features**

### Batch Requests
Send multiple requests in a single API call (Gold tier only):

```bash
curl -X POST \
     -H "Authorization: Bearer YOUR_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{
       "requests": [
         {"method": "GET", "path": "/analyze/contract/0x1234..."},
         {"method": "GET", "path": "/market/price/ETH"},
         {"method": "POST", "path": "/ai/query", "body": {"query": "..."}}
       ]
     }' \
     https://api.vectorai.pro/v1/batch
```

### Real-time WebSocket
Connect to real-time data streams:

```javascript
const ws = new WebSocket('wss://api.vectorai.pro/v1/ws');
ws.onopen = () => {
  ws.send(JSON.stringify({
    auth: 'YOUR_API_KEY',
    subscribe: ['whale_movements', 'price_alerts']
  }));
};
```

---

## 📞 **Support & Resources**

- **API Status**: https://status.vector-ai.pro
- **Postman Collection**: https://vector-ai.pro/postman
- **OpenAPI Spec**: https://api.vectorai.pro/v1/openapi.json
- **Developer Community**: https://t.me/vectorai_tg
- **Rate Limit Dashboard**: https://vector-ai.pro/usage

**Need help?** Contact our developer support team at team@vector-ai.pro

---

## 🌐 **Official Links**

- **🌐 Website**: https://vector-ai.pro
- **🐦 Twitter/X**: https://x.com/vectorai_x
- **💬 Telegram**: https://t.me/vectorai_tg
- **📧 Email**: team@vector-ai.pro
