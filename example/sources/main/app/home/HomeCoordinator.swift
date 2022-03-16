@testable import Coordinator
import UIKit

public final class HomeCoordinator: Coordinating {

    var window: UIWindow

    public init(parent: Coordinating, window: UIWindow) {
        self.children = []
        self.parent = parent
        self.window = window
    }

    private var homeViewController: UIViewController {
        let controller = UIViewController()
        let label = UILabel()
        label.text = "Home"
        controller.view.addSubview(label)
        controller.view.backgroundColor = .systemPurple
        return controller
    }

    // MARK: - Coordinating

    public var children: [Coordinating]
    public var parent: Coordinating?

    public func start() {
        window.rootViewController = homeViewController
    }
}
