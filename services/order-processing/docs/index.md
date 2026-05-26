# Order Processing Service

Handles order lifecycle from placement through fulfillment, including payment orchestration.

## Order States
1. PENDING -> CONFIRMED -> PROCESSING -> SHIPPED -> DELIVERED
2. Any state -> CANCELLED (with compensation)

## Dependencies
- Payment Gateway (payment processing)
- Inventory Service (stock reservation)
- Notification Service (order updates)
