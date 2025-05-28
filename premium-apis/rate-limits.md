# Rate Limits

Vector AI implements tier-based rate limiting to ensure fair usage and platform stability. Rate limits are determined by your VECTOR token staking tier.

## **Rate Limit Structure**

| Tier | Staking Required | Request Frequency | Daily Limit | Burst Limit |
|------|------------------|-------------------|-------------|-------------|
| **Free** | 0 VECTOR | 1 per 30 seconds | 50 requests | 5 requests |
| **Bronze** | 100,000 VECTOR | 1 per 10 seconds | 500 requests | 10 requests |
| **Silver** | 1,000,000 VECTOR | 1 per 5 seconds | 2,500 requests | 25 requests |
| **Gold** | 10,000,000 VECTOR | Unlimited | Unlimited | 100 requests |

## **Rate Limit Types**

### **Request Frequency**
- Maximum requests per time period
- Prevents spam and abuse
- Ensures platform stability

### **Daily Limits**
- Total requests allowed per 24-hour period
- Resets at 00:00 UTC daily
- Tracks cumulative usage

### **Burst Limits**
- Maximum concurrent requests
- Prevents system overload
- Applies to simultaneous API calls

## **Rate Limit Headers**

API responses include rate limit information:

```http
X-RateLimit-Limit: 2500
X-RateLimit-Remaining: 2487
X-RateLimit-Reset: 1640995200
X-RateLimit-Tier: Silver
```

## **Exceeding Limits**

### **Soft Limits**
- Requests queued for processing
- Slight delay in response time
- No requests rejected

### **Hard Limits**
- Requests rejected with 429 status
- Must wait for limit reset
- Upgrade tier for higher limits

### **Error Response**
```json
{
  "error": {
    "code": "RATE_LIMIT_EXCEEDED",
    "message": "Rate limit exceeded for your tier",
    "retry_after": 30,
    "upgrade_url": "https://vector-ai.pro/staking"
  }
}
```

## **Optimization Tips**

### **Efficient Usage**
- Batch multiple queries when possible
- Cache responses to reduce API calls
- Use webhooks for real-time updates
- Implement exponential backoff

### **Tier Upgrades**
- Stake more VECTOR for higher limits
- Gold tier removes most restrictions
- Enterprise solutions available

## **Monitoring Usage**

### **Dashboard Tracking**
- Real-time usage statistics
- Historical usage patterns
- Tier utilization metrics
- Upgrade recommendations

### **Alerts**
- Approaching limit notifications
- Usage spike warnings
- Tier upgrade suggestions

---

## **Need Higher Limits?**

**Upgrade Your Tier**:
- **[Staking Guide](../token-and-economics/staking.md)** - Learn how to stake VECTOR
- **[Pricing](pricing.md)** - Compare tier benefits

**Enterprise Solutions**:
- Custom rate limits
- Dedicated infrastructure
- SLA guarantees
- Contact: team@vector-ai.pro
