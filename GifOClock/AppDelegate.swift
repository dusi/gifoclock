//
//  AppDelegate.swift
//  GifOClock
//
//  Created by Jason Peebles on 2015-03-24.
//  Copyright (c) 2015 Themis Solutions Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //Customize appearance
        UINavigationBar.appearance().barTintColor = UIColor.blackColor()
        
        return true
    }
    
    func application(application: UIApplication, handleWatchKitExtensionRequest userInfo: [NSObject : AnyObject]?, reply: (([NSObject : AnyObject]!) -> Void)!) {
        let filename = "filename"
        let framesCount = 20
        
        reply(["search.filename": filename, "search.framesCount": framesCount])
    }
    
}

