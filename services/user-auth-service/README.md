# User Authentication Service

## Overview
Handles user authentication, session management, OAuth2 flows, and JWT token issuance for all platform services.

## Tech Stack
- Java 21 (Spring Boot 3.2)
- PostgreSQL 16
- Redis (session cache)
- Keycloak (identity provider)

## Quick Start
```bash
./mvnw spring-boot:run -Dspring.profiles.active=local
```

## API Endpoints
| Method | Path | Description |
|--------|------|-------------|
| POST | /auth/login | Authenticate user |
| POST | /auth/refresh | Refresh JWT token |
| POST | /auth/logout | Invalidate session |
| GET | /auth/userinfo | Get current user info |

## Architecture
See [architecture docs](docs/architecture.md) for detailed diagrams.

## Runbook
See [runbook](docs/runbook.md) for operational procedures.

## Owner
- Team: platform-engineering
- On-call: PagerDuty integration PD-AUTH-001
