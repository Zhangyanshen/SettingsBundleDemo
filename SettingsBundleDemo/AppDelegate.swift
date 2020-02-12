//
//  AppDelegate.swift
//  SettingsBundleDemo
//
//  Created by 张延深 on 2020/2/11.
//  Copyright © 2020 张延深. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let settingsBundle = Bundle.main.path(forResource: "Settings", ofType: "bundle") else { return true }
        guard let settings = NSDictionary(contentsOfFile: settingsBundle.appending("/Root.plist")) else { return true }
        guard let preferences = settings.object(forKey: "PreferenceSpecifiers") as? Array<Any> else { return true }
        var defaultsToRegister = Dictionary<String, Any>(minimumCapacity: preferences.count)
        preferences.forEach { element in
            if let dic = element as? Dictionary<String, Any> {
                if let key = dic["Key"] as! String? {
                    defaultsToRegister[key] = dic["DefaultValue"]
                }
            }
        }
        UserDefaults.standard.register(defaults: defaultsToRegister)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

