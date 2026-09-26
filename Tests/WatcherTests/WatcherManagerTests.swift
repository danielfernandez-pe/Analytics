import Foundation
import Testing
@testable import Watcher

private final class RecordingService: AnalyticsServiceType, @unchecked Sendable {
    enum Call: Equatable {
        case global(String, AnalyticsValue?)
        case user(String, String?)
    }

    private let lock = NSLock()
    private var recorded: [Call] = []
    var calls: [Call] { lock.withLock { recorded } }

    func logEvent(_ event: AnalyticsEvent) {}
    func logScreen(name: String) {}
    func setGlobalProperty(_ value: AnalyticsValue?, forName name: String) {
        lock.withLock { recorded.append(.global(name, value)) }
    }
    func setUserProperty(_ value: String?, forName name: String) {
        lock.withLock { recorded.append(.user(name, value)) }
    }
}

@Test func forwardsDistinctSettersAndRemovalToEveryProvider() {
    let first = RecordingService()
    let second = RecordingService()
    let analytics: any AnalyticsServiceType = WatcherManager(services: [first, second])

    analytics.setGlobalProperty(3, forName: "attempts")
    analytics.setUserProperty("premium", forName: "tier")
    analytics.setGlobalProperty(nil, forName: "attempts")
    analytics.setUserProperty(nil, forName: "tier")

    let expected: [RecordingService.Call] = [
        .global("attempts", .integer(3)), .user("tier", "premium"),
        .global("attempts", nil), .user("tier", nil)
    ]
    #expect(first.calls == expected)
    #expect(second.calls == expected)
}

@Test func bulkConvenienceForwardsEveryValueAndEmptyInputDoesNothing() {
    let service = RecordingService()
    let analytics: any AnalyticsServiceType = WatcherManager(services: [service])
    let parameters: AnalyticsEvent.Parameters = [
        "platform": "ios", "attempts": 3, "ratio": 0.5, "enabled": true
    ]
    analytics.setGlobalParameters(parameters)
    analytics.setGlobalParameters([:])

    #expect(service.calls.count == parameters.count)
    for (name, value) in parameters {
        #expect(service.calls.contains(.global(name, value)))
    }
}
