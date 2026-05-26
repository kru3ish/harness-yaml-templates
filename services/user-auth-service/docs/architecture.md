# Architecture

## System Context
The User Auth Service is the central authentication gateway for all platform services.

## Components
```
Client -> API Gateway -> Auth Service -> Keycloak (IdP)
                                      -> PostgreSQL (users)
                                      -> Redis (sessions)
```

## Authentication Flow
1. Client sends credentials to /auth/login
2. Auth service validates against Keycloak
3. On success: JWT issued, session stored in Redis
4. Token refresh via /auth/refresh (no re-authentication)
5. Logout invalidates both JWT and Redis session

## Security
- Passwords: bcrypt with cost factor 12
- JWT: RS256 with 15-min expiry
- Refresh tokens: 7-day expiry, single-use
- Rate limiting: 5 failed attempts = 15min lockout
