# Notification Service Architecture

## Design
Event-driven architecture with channel-specific adapters.

## Flow
```
Event Bus -> Notification Router -> Channel Adapter -> External API
                                                    -> Delivery Tracker
                                                    -> Dead Letter Queue
```

## Reliability
- At-least-once delivery guarantee
- Exponential backoff: 1s, 2s, 4s, 8s, 16s (max 5 retries)
- Dead letter queue for permanently failed notifications
- Delivery receipts tracked per notification ID
