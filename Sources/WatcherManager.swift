//
//  WatcherManager.swift
//  Watcher
//
//  Created by Daniel Fernandez Yopla on 22.08.2026.
//

public struct WatcherManager: AnalyticsServiceType, Sendable {
    private var services: [any AnalyticsServiceType]

    public init(services: [any AnalyticsServiceType]) {
        self.services = services
    }

    public func logEvent(_ event: AnalyticsEvent) {
        services.forEach {
            $0.logEvent(event)
        }
    }

    public func logScreen(name: String) {
        services.forEach {
            $0.logScreen(name: name)
        }
    }

    public func setGlobalParameter(_ value: AnalyticsValue?, forName name: String) {
        services.forEach {
            $0.setGlobalParameter(value, forName: name)
        }
    }

    public func setUserProperty(_ value: String?, forName name: String) {
        services.forEach {
            $0.setUserProperty(value, forName: name)
        }
    }
}
