@testable import Coordinator
import UIKit

public final class HomeCoordinator: Coordinator {

    var window: UIWindow

    public init(parent: Coordinator, window: UIWindow) {
        self.children = []
        self.parent = parent
        self.window = window
    }

    private var homeViewController: UIViewController {
        let controller = UIViewController()
        let label = UILabel()
        label.text = "Home"
        controller.view.addSubview(label)
        controller.view.backgroundColor = .systemOrange
        return controller
    }

    // MARK: - Coordinator

    public var children: [Coordinator]
    public var parent: Coordinator?

    public func start() {
        window.rootViewController = homeViewController
    }
}
