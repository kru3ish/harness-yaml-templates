# Runbook - Order Processing Service

## Health
- Endpoint: GET /health
- Order queue depth: GET /admin/queue-depth

## Common Issues

### Order Stuck in Processing
**Symptoms**: Order status doesn't advance
**Fix**: Check payment gateway response, retry via /admin/retry/{orderId}

### Duplicate Orders
**Symptoms**: Same order appears twice
**Fix**: Idempotency key collision - verify client-side key generation

## Deployment
- Blue-green deployment
- Drain existing orders before switch (max 5min)
