# Payment Gateway Service - Runbook

## Service Overview
Secure payment processing gateway handling credit card transactions, refunds, and payment provider integrations.

## On-Call Contacts
- Primary: platform-engineering-team
- Escalation: engineering-leadership

## Common Issues & Remediation
1. **Payment timeout**: Check Stripe API status, increase timeout to 30s
2. **Refund failure**: Verify idempotency key, retry with new key
3. **Rate limiting**: Scale horizontally, enable circuit breaker

## Deployment
- Strategy: Canary (10% → 50% → 100%)
- Rollback: Automatic on error rate > 1%
