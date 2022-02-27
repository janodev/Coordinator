@testable import Coordinator
import os
import UIKit

public final class MainCoordinator: RootCoordinating
{
    private let log = Logger(subsystem: "dev.jano", category: "coordinator")

    // MARK: - Coordinator

    public var children = [Coordinating]() {
        didSet {
            if children.isEmpty {
                log.debug("No children left. Calling start() again")
                start()
            }
        }
    }

    public var parent: Coordinating?

    public func start()
    {
        log.debug("Starting \(self.debugDescription)")
        guard let child = initialCoordinator() else {
            log.debug("Can’t start. The initial coordinator is not ready.")
            return
        }
        children = [child]
        child.start()
    }

    public func finish() { /* never ends */ }

    // MARK: - RootCoordinator

    public var window: UIWindow

    // MARK: - Other

    private var credentials: String?

    private func initialCoordinator() -> Coordinating? {
        switch credentials {
        case .some:
            log.debug("Credentials found. Navigating to some screen.")
            return HomeCoordinator(parent: self, window: window)
        case .none:
            log.debug("Missing credentials. Navigating to login.")
            return LoginCoordinator(parent: self, window: window)
        }
    }

    public init(window: UIWindow) {
        self.window = window
    }
}
