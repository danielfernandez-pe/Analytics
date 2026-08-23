//
//  WatcherManager.swift
//  Watcher
//
//  Created by Daniel Fernandez Yopla on 22.08.2026.
//

public struct WatcherManager: WatcherServiceType, Sendable {
    private var services: [any WatcherServiceType]

    public init(services: [any WatcherServiceType]) {
        self.services = services
    }

    public func logEvent(_ event: WatcherEvent) {
        services.forEach {
            $0.logEvent(event)
        }
    }

    public func setGlobalParameters(_ parameters: WatcherEvent.Parameters) {
        services.forEach {
            $0.setGlobalParameters(parameters)
        }
    }
}
