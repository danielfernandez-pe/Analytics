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

Set default event parameters and user properties separately:

```swift
analytics.setGlobalProperty("ios", forName: "platform")
analytics.setGlobalProperty(3, forName: "attempt_count")
analytics.setUserProperty("premium", forName: "subscription_tier")

// Remove a previously set value.
analytics.setGlobalProperty(nil, forName: "attempt_count")
analytics.setUserProperty(nil, forName: "subscription_tier")

// Bulk updates remain available as a convenience.
analytics.setGlobalParameters(["platform": "ios", "is_subscriber": true])
```

Global parameters are defaults for subsequent events. Setting or removing one
must preserve other defaults. User properties describe the user and are kept
separate from event parameters. Every call is forwarded to all configured services.

### Migrating to 4.0.0

When upgrading from 3.0.0, rename `setGlobalParameter(_:forName:)` to
`setGlobalProperty(_:forName:)` in providers and call sites. The plural
`setGlobalParameters(_:)` convenience method remains available.

When upgrading from 2.x:

Provider implementations must replace the `setGlobalParameters(_:)` requirement
with `setGlobalProperty(_:forName:)` and implement `setUserProperty(_:forName:)`.
The bulk method is now a protocol extension that calls the singular setter for
each entry; an empty dictionary makes no changes. Providers must support `nil`
to remove a value. User properties accept strings, while global parameters use
`AnalyticsValue` to support strings, integers, doubles, and booleans.
