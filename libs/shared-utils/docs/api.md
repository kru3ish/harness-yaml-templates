# API Reference

## Logger

### logger.child(context)
Creates a child logger with additional context fields.

### logger.info(message, meta?)
Log at INFO level.

### logger.error(message, error?, meta?)
Log at ERROR level with optional error stack.

## Tracer

### tracer.startSpan(name, options?)
Start a new OpenTelemetry span.

### tracer.withSpan(name, fn)
Execute function within a traced span.

## Config

### config.get(key)
Get configuration value (env var or config file).

### config.require(key)
Get required config value, throws if missing.

## HTTP Client

### httpClient.get(url, options?)
GET with retry and circuit breaker.

### httpClient.post(url, body, options?)
POST with retry and circuit breaker.
