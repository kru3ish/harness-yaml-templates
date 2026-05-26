# Runbook - Notification Service

## Overview
Multi-channel notification dispatch (email, SMS, Slack, push) with retry logic.

## Health
- Endpoint: GET /health
- Channel status: GET /channels/status

## Common Issues

### Email Delivery Failures
**Symptoms**: SendGrid API errors
**Fix**: Check API key validity, verify sender domain DNS

### SMS Rate Limiting
**Symptoms**: Twilio 429 errors
**Fix**: Implement exponential backoff, check account limits

### Slack Webhook Invalid
**Symptoms**: 404 on Slack delivery
**Fix**: Regenerate webhook URL in Slack admin

## SLA
- Email: delivered within 60s (p95)
- SMS: delivered within 30s (p95)
- Slack: delivered within 5s (p95)
- Push: delivered within 10s (p95)
