//
//  AnalyticsManager.swift
//  Analytics
//
//  Created by Daniel Fernandez Yopla on 22.08.2026.
//

public struct AnalyticsManager: AnalyticsServiceType, Sendable {
    private var services: [any AnalyticsServiceType]
    
    public init(services: [any AnalyticsServiceType]) {
        self.services = services
    }
    
    public func logEvent(_ event: AnalyticsEvent) {
        services.forEach {
            $0.logEvent(event)
        }
    }
    
    public func setGlobalParameters(_ parameters: AnalyticsEvent.Parameters) {
        services.forEach {
            $0.setGlobalParameters(parameters)
        }
    }
}
