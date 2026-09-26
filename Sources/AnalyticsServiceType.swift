public protocol AnalyticsServiceType: Sendable {
    func logEvent(_ event: AnalyticsEvent)
    func logScreen(name: String)
    func setGlobalParameters(_ parameters: AnalyticsEvent.Parameters)
}
