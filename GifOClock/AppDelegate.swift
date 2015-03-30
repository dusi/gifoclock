//
//  AppDelegate.swift
//  GifOClock
//
//  Created by Jason Peebles on 2015-03-24.
//  Copyright (c) 2015 Themis Solutions Inc. All rights reserved.
//

import UIKit
import GifOClockKit

let suiteName = "group.themis.gifoclock"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //Customize appearance
        UINavigationBar.appearance().barTintColor = UIColor.blackColor()
        
        return true
    }
    
    func application(application: UIApplication, handleWatchKitExtensionRequest userInfo: [NSObject : AnyObject]?, reply: (([NSObject : AnyObject]!) -> Void)!) {
        gifSearch(userInfo?["search.text"] as! String, { items in
            let gif = items.sample()
            let filename = gif.id
            GIFConverter().exportUrl(gif.smallUrl, size: CGSizeMake(CGFloat(gif.smallWidth), CGFloat(gif.smallHeight)), suiteName: suiteName, filename: filename, completion: { framesCount in
                reply(["search.filename": filename, "search.framesCount": framesCount])
            })
        })
    }
    
}

extension Array {
    func sample() -> T {
        let randomIndex = random() % count
        return self[randomIndex]
    }
}
