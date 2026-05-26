# Payment Gateway - Architecture

## Overview
Microservice handling all payment operations via provider abstraction layer.

## Components
- API Gateway → Payment Router → Provider Adapters (Stripe, PayPal)
- Event Store for audit trail
- Redis for idempotency keys

## Data Flow
1. Client → API Gateway → Payment Service
2. Payment Service → Provider Adapter → External Payment API
3. Response → Event Store → Client notification
