//
//  WatcherBootstrap.swift
//  Watcher
//
//  Created by Daniel Fernandez Yopla on 22.08.2026.
//

public class WatcherBootstrap {
    nonisolated(unsafe) private static var configuredServices: [any WatcherServiceType] = []

    public static func configure(@WatcherBuilder _ builder: () -> [any WatcherServiceType]) {
        configuredServices = builder()
    }

    public static func getConfiguredLoggers() -> [any WatcherServiceType] {
        return configuredServices
    }
}

@resultBuilder
public struct WatcherBuilder {
    public static func buildBlock(_ services: (any WatcherServiceType)...) -> [any WatcherServiceType] {
        return Array(services)
    }
}
