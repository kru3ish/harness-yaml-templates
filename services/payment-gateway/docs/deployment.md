# Payment Gateway - Deployment Guide

## Pre-deployment Checklist
1. All tests passing in CI
2. Security scan clear (no critical/high)
3. Scorecard >= 80%
4. Change description documented
5. Rollback plan confirmed

## Deployment Strategy
- Canary: 10% -> 50% -> 100%
- Each step: 5-minute bake time
- Automatic rollback on: error rate > 1%, latency p99 > 2s

## Post-deployment Verification
1. Smoke tests: /health, /payments/test-charge
2. Monitor: error rate, latency, success rate
3. Verify: PCI compliance scan passes
