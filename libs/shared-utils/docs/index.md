# Shared Platform Utilities

Common utility library providing cross-cutting concerns for all platform microservices.

## Modules

| Module | Description |
|--------|-------------|
| logger | Structured JSON logging with correlation IDs |
| tracer | OpenTelemetry distributed tracing wrapper |
| config | Environment-aware configuration loader |
| errors | Standardized error types and HTTP mapping |
| http | Resilient HTTP client with retry/circuit-breaker |

## Installation

```
npm install @eprod/shared-utils
```

## Usage

```typescript
import { logger, tracer, config } from "@eprod/shared-utils";

const log = logger.child({ service: "my-service" });
log.info("Service started", { port: config.get("PORT") });
```
