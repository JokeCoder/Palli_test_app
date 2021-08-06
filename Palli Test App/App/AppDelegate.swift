//
//  AppDelegate.swift
//  Palli Test App
//
//  Created by YIM LLC on 06/08/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.backgroundColor = .white
        window?.rootViewController = BooksRouter.createModule()
        window?.makeKeyAndVisible()
        
        return true
    }
    



}

