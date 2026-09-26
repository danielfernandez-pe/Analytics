public protocol AnalyticsServiceType: Sendable {
    func logEvent(_ event: AnalyticsEvent)
    func logScreen(name: String)
    /// Sets a default event parameter. Passing nil removes it; other parameters are unchanged.
    func setGlobalProperty(_ value: AnalyticsValue?, forName name: String)

    /// Sets a user property independently of event parameters. Passing nil removes it.
    func setUserProperty(_ value: String?, forName name: String)
}

public extension AnalyticsServiceType {
    /// Updates the supplied default event parameters, preserving other parameters.
    func setGlobalParameters(_ parameters: AnalyticsEvent.Parameters) {
        for (name, value) in parameters {
            setGlobalProperty(value, forName: name)
        }
    }
}
