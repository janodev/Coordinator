@testable import Coordinator
import UIKit

public final class LoginCoordinator: Coordinator {

    var window: UIWindow

    public init(parent: Coordinator, window: UIWindow) {
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

    public var children: [Coordinator]
    public var parent: Coordinator?

    public func start() {
        window.rootViewController = loginViewController
    }
}
