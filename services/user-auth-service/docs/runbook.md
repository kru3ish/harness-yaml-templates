# Runbook - User Auth Service

## Service Health
- Health endpoint: GET /actuator/health
- Metrics: /actuator/prometheus
- Expected p99 latency: < 200ms

## Common Issues

### 1. High Authentication Latency
**Symptoms**: Login requests > 500ms
**Diagnosis**: Check Redis connection pool, Keycloak response time
**Fix**: Scale Redis replicas or restart connection pool

### 2. JWT Validation Failures
**Symptoms**: 401 errors on valid tokens
**Diagnosis**: Check key rotation schedule, clock drift
**Fix**: Verify JWKS endpoint, sync NTP

### 3. Session Store Full
**Symptoms**: Redis memory > 90%
**Diagnosis**: Check expired session cleanup job
**Fix**: Run manual cleanup: `redis-cli --scan --pattern "session:*" | xargs redis-cli del`

## Deployment
- Canary deployment with 10% -> 50% -> 100% progression
- Rollback trigger: error rate > 0.5% in 5-min window
- Rollback time: < 2 minutes (automatic)

## Contacts
- Primary: platform-engineering-team
- Escalation: VP Engineering
- PagerDuty: PD-AUTH-001
