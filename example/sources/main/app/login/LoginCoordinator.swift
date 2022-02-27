@testable import Coordinator
import UIKit

public final class LoginCoordinator: Coordinating {

    var window: UIWindow

    public init(parent: Coordinating, window: UIWindow) {
        self.children = []
        self.parent = parent
        self.window = window
    }

    private var loginViewController: UIViewController {
        let controller = UIViewController()
        let label = UILabel()
        label.text = "Login"
        controller.view.addSubview(label)
        controller.view.backgroundColor = .systemOrange
        return controller
    }

    // MARK: - Coordinator

    public var children: [Coordinating]
    public var parent: Coordinating?

    public func start() {
        window.rootViewController = loginViewController
    }
}
