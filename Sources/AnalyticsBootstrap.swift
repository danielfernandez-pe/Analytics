//
//  AnalyticsBootstrap.swift
//  Analytics
//
//  Created by Daniel Fernandez Yopla on 22.08.2026.
//

public class AnalyticsBootstrap {
    nonisolated(unsafe) private static var configuredServices: [any AnalyticsServiceType] = []

    public static func configure(@AnalyticsBuilder _ builder: () -> [any AnalyticsServiceType]) {
        configuredServices = builder()
    }

    public static func getConfiguredLoggers() -> [any AnalyticsServiceType] {
        return configuredServices
    }
}

@resultBuilder
public struct AnalyticsBuilder {
    public static func buildBlock(_ services: (any AnalyticsServiceType)...) -> [any AnalyticsServiceType] {
        return Array(services)
    }
}
