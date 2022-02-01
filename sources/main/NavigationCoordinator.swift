import UIKit

@MainActor
public protocol NavigationCoordinator: Coordinator, UINavigationControllerDelegate {
    
    var navigationController: UINavigationController { get }
}
