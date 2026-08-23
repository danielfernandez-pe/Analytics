//
//  WatcherEvent.swift
//  Watcher
//
//  Created by Daniel Fernandez Yopla on 22.08.2026.
//

public struct WatcherEvent: Sendable, Equatable {
    public typealias Parameters = [String: WatcherValue]

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
