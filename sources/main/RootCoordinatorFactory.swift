import UIKit

public struct RootCoordinatorFactory
{
    private let createRootCoordinator: @MainActor (UIWindow) -> RootCoordinating

    public init(createRootCoordinator: @escaping @MainActor (UIWindow) -> RootCoordinating) {
        self.createRootCoordinator = createRootCoordinator
    }

    @MainActor
    public func create(window: UIWindow) -> RootCoordinating {
        createRootCoordinator(window)
    }
}
