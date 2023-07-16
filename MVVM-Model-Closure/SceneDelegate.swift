//
//  SceneDelegate.swift
//  MVVM-Model-Closure
//
//  Created by YUSUF KESKİN on 2.07.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        let vc = composeRootViewController()
        let appWindow = UIWindow(windowScene: scene)
        appWindow.rootViewController = vc
        window = appWindow
        window?.makeKeyAndVisible()
        
    }
    
    func composeRootViewController() -> FoodVC {
        let solidApi = SolidApi()
        let liquidApi = LiquidApi()
        let spiceApi = SpiceApi()
        
        let model = FoodViewModel(apis: [
            solidApi,
            liquidApi,
            spiceApi
        ])

        let board = UIStoryboard(name: "Main", bundle: nil)
        let rootVC = board.instantiateViewController(withIdentifier: "FoodVC") as! FoodVC
        rootVC.model = model
        model.vc = rootVC
        
        return rootVC
    }
    
    
    
    
    

    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

