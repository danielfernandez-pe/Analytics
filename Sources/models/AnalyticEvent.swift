//
//  AnalyticEvent.swift
//  Watcher
//
//  Created by Daniel Fernandez Yopla on 22.08.2026.
//

public struct AnalyticsEvent: Sendable, Equatable {
    public typealias Parameters = [String: AnalyticsValue]

    public let name: String
    public let parameters: Parameters

    public init(
        name: String,
        parameters: Parameters = [:]
    ) {
        self.name = name
        self.parameters = parameters
    }
}
