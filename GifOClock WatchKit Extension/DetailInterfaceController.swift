//
//  DetailInterfaceController.swift
//  GifOClock
//
//  Created by Pavel Dusatko on 2015-03-29.
//  Copyright (c) 2015 Themis Solutions Inc. All rights reserved.
//

import WatchKit
import Foundation

let suiteName = "group.paveldusatko.gifoclock"

class DetailInterfaceController: WKInterfaceController {
    
    // MARK: - Properties
    
    @IBOutlet weak var imageView: WKInterfaceImage!
    
    var text: String?
    
    // MARK: - Lifecycle

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        text = context as? String
    }

    override func willActivate() {
        super.willActivate()
        
        search(text!)
    }
    
    // MARK: - Actions
    
    func search(text: String) {
        WKInterfaceController.openParentApplication(["search.text": text], reply: { (reply, _) in
            let filename = reply["search.filename"] as! String
            let framesCount = reply["search.framesCount"] as! Int
            
            self.showImage(filename, framesCount: framesCount)
        })
    }
    
    func showImage(filename: String, framesCount: Int) {
        let containerUrl = NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier(suiteName)?.URLByAppendingPathComponent("Frames", isDirectory: true)
        
        var images = [UIImage]()
        
        for index in 0..<framesCount {
            let url = containerUrl?.URLByAppendingPathComponent("\(filename)-\(index).png", isDirectory: false)
            let data = NSData(contentsOfURL: url!)
            let image = UIImage(data: data!)
            images.append(image!)
        }
        
        let animatedImage = UIImage.animatedImageWithImages(images, duration: 1)
        let animatedImageName = suiteName.stringByAppendingPathExtension("image")
        
        WKInterfaceDevice.currentDevice().addCachedImage(animatedImage, name: animatedImageName!)
        
        imageView.setImageNamed(animatedImageName)
        imageView.startAnimatingWithImagesInRange(NSMakeRange(0, framesCount), duration: 1, repeatCount: -1)
    }

}
