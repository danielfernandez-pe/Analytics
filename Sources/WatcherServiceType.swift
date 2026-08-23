public protocol WatcherServiceType: Sendable {
    func logEvent(_ event: WatcherEvent)
    func setGlobalParameters(_ parameters: WatcherEvent.Parameters)
}
