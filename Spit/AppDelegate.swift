//
//  AppDelegate.swift
//  Spit
//
//  Created by Haaris Muneer on 8/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FIRApp.configure()
        
        SoundcloudAPIClient.getSongsMatchingSearchTerm(_searchTerm: "drake") { (response) in
            print(response.count)
        }
        
        return true
    }



}

