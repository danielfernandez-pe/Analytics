//
//  WatcherValue.swift
//  Watcher
//
//  Created by Daniel Fernandez Yopla on 22.08.2026.
//

public enum WatcherValue: Sendable, Equatable {
    case string(String)
    case integer(Int)
    case double(Double)
    case boolean(Bool)
}

extension WatcherValue: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = .string(value)
    }
}

extension WatcherValue: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .integer(value)
    }
}

extension WatcherValue: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self = .double(value)
    }
}

extension WatcherValue: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = .boolean(value)
    }
}
