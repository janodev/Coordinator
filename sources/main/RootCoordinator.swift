import UIKit

@MainActor
public protocol RootCoordinator: Coordinator {
    
    var window: UIWindow { get }
}
