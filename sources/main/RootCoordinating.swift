import UIKit

@MainActor
public protocol RootCoordinating: Coordinating {
    
    var window: UIWindow { get }
}
