//
//  AppDelegate.swift
//  ShieldBehavioural-SPM-Demo
//
//  Created by Deepakraj on 12/3/24.
//

import UIKit
import ShieldFraud
import BehaviouralAnalysis

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let config = Configuration(withSiteId: "SHIELD_SITE_ID", secretKey: "SHIELD_SECRET_KEY")
        config.logLevel = LogLevel.info
        config.environment = .prod
        config.deviceShieldCallback = self
        config.modules = [BehaviouralModule()]
        Shield.setUp(with: config)
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

extension AppDelegate: DeviceShieldCallback {
    func didSuccess(result: [String : Any]) {
        print("success: ", result)
    }
    
    func didError(error: NSError) {
        print("failure", error)
    }
    
    
}
