# Runbook - Inventory Service

## Health
- Endpoint: GET /health
- Expected latency: < 100ms for reads, < 500ms for writes

## Common Issues

### Stock Sync Lag
**Symptoms**: Warehouse counts don't match system
**Fix**: Trigger manual reconciliation via /admin/reconcile

### Kafka Consumer Lag
**Symptoms**: Orders not reflected in inventory
**Fix**: Check consumer group offset, restart consumers if > 1000 lag

## Deployment
- Rolling deployment (zero downtime)
- Health check: 3 consecutive passes before traffic shift
