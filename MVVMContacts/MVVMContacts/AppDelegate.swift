//
//  AppDelegate.swift
//  MVVMContacts
//
//  Created by Héctor Cuevas on 5/2/19.
//  Copyright © 2019 Héctor Cuevas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = ContactsListViewController()
        
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }


}

