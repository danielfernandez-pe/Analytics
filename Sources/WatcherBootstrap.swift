//
//  WatcherBootstrap.swift
//  Watcher
//
//  Created by Daniel Fernandez Yopla on 22.08.2026.
//

public class WatcherBootstrap {
    nonisolated(unsafe) private static var configuredServices: [any AnalyticsServiceType] = []

    public static func configure(@WatcherBuilder _ builder: () -> [any AnalyticsServiceType]) {
        configuredServices = builder()
    }

    public static func getConfiguredLoggers() -> [any AnalyticsServiceType] {
        return configuredServices
    }
}

@resultBuilder
public struct WatcherBuilder {
    public static func buildBlock(_ services: (any AnalyticsServiceType)...) -> [any AnalyticsServiceType] {
        return Array(services)
    }
}
