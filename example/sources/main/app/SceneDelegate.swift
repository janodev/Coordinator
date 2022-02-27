import Coordinator
import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate
{
    var window: UIWindow?
    private var coordinator: Coordinating?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)
    {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window
            coordinator = MainCoordinator(window: window)
            coordinator?.start()
            window.makeKeyAndVisible()
        }
    }
}
