//
//  AppDelegate.swift
//  TartuWeatherTV
//
//  Created by Kristaps Grinbergs on 03/12/2016.
//  Copyright © 2016 Kristaps Grinbergs. All rights reserved.
//

import UIKit

import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    Fabric.with([Crashlytics.self])

    return true
  }

}

