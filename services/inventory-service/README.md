# Inventory Management Service

## Overview
Real-time inventory tracking, stock level management, warehouse integration, and automated reorder point calculations.

## Tech Stack
- Python 3.12 (FastAPI)
- PostgreSQL 16
- Apache Kafka (event streaming)
- Redis (cache layer)

## Quick Start
```bash
uvicorn main:app --reload --port 8000
```

## API Endpoints
| Method | Path | Description |
|--------|------|-------------|
| GET | /inventory/{sku} | Get stock level |
| POST | /inventory/reserve | Reserve stock |
| POST | /inventory/release | Release reservation |
| GET | /inventory/reorder-alerts | List low stock items |

## Owner
- Team: commerce-team
- On-call: PagerDuty PD-INV-002
