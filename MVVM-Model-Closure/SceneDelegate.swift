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
        
        let board = UIStoryboard(name: "Main", bundle: nil)
        let rootVC = board.instantiateViewController(withIdentifier: "FoodVC") as! FoodVC
        
        solidApi.vc = rootVC
        liquidApi.vc = rootVC
        spiceApi.vc = rootVC

        let model = FoodViewModel()
        
        model.apis = [
            solidApi,
            liquidApi,
            spiceApi
        ]
        
        rootVC.model = model        
        
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

