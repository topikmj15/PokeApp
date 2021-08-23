//
//  AppDelegate.swift
//  PokeApp
//
//  Created by Topik Mujianto on 20/08/21.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000.0, vertical: 0.0), for: .default)
    
    window = UIWindow()
    window?.rootViewController = Navigation.initMainMenu()
    window?.makeKeyAndVisible()
    
    return true
  }
  
}

