# Inventory Management Service

Real-time inventory tracking with warehouse sync, stock alerts, and reservation management.

## Architecture

- **Runtime**: Java 21 + Spring Boot 3.2
- **Database**: PostgreSQL 16 with read replicas
- **Cache**: Redis Cluster for stock level lookups
- **Queue**: Kafka for async warehouse sync events

## Key Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | /api/v1/stock/{sku} | Get current stock level |
| POST | /api/v1/reservations | Create reservation |
| PUT | /api/v1/stock/{sku}/adjust | Adjust stock (warehouse sync) |
| GET | /api/v1/alerts | List active stock alerts |

## SLA

- Availability: 99.92% (target 99.9%)
- P99 latency: 45ms for reads, 120ms for writes
