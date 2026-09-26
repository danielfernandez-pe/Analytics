# Watcher

A shared analytics interface that forwards calls to configured services.

Track a screen using only its name:

```swift
let analytics = WatcherManager(services: WatcherBootstrap.getConfiguredLoggers())
analytics.logScreen(name: "session")
```

Each `AnalyticsServiceType` implementation must implement `logScreen(name:)`
using its SDK's screen tracking support. No screen class or extra parameters
are required by the interface.
