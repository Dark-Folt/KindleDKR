//
//  AppDelegate.swift
//  KindleDKR
//
//  Created by Kamil Ben on 08/01/2019.
//  Copyright © 2019 Dark Folt. All rights reserved.
//

import UIKit


//It's for applying my status barStyle on both modes
class StatusBarPreferece: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Creating my View
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
       /* let MainTableViewController = TableViewController()
        
        //I want a navigationBa on the top of my App
        let navController = StatusBarPreferece(rootViewController: MainTableViewController)
        
        //This navigation controller will be the root View controller
        window?.rootViewController = navController*/
        
        self.launchScreen()
        //Je par définir mon theme en partant chercher dans mon userDefaults
        Theme.currentTheme = UserDefaults.standard.bool(forKey: Keys.prefersDarkMode) ? DarkTheme() : LightTheme()
        
        return true
    }
    
    //MARK- My Own Launch Screen demo with time duration
    private func launchScreen(){
        let launchScreenVC = UIStoryboard(name: "LaunchScreen", bundle: nil)
        let rootVC = launchScreenVC.instantiateViewController(withIdentifier: "splachScreen")
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()
        Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(dissmissLaunchScreen), userInfo: nil, repeats: false)
    }
    
    @objc private func dissmissLaunchScreen(){
            let MainTableViewController = TableViewController()
         
            //I want a navigationBa on the top of my App
            let navController = StatusBarPreferece(rootViewController: MainTableViewController)
         
            //This navigation controller will be the root View controller
            window?.rootViewController = navController
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

