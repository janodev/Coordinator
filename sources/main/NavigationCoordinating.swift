import UIKit

@MainActor
public protocol NavigationCoordinating: Coordinating, UINavigationControllerDelegate {
    var navigationController: UINavigationController { get }
}
