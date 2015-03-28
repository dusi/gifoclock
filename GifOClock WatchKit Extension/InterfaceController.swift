//
//  InterfaceController.swift
//  GifOClock WatchKit Extension
//
//  Created by Pavel Dusatko on 2015-03-27.
//  Copyright (c) 2015 Themis Solutions Inc. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    // MARK: - Lifecycle

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // MARK: - Actions
    
    func search(text: String) {
        println("text = \(text)")
    }

    @IBAction func showTextInput() {
        presentTextInputControllerWithSuggestions(nil, allowedInputMode: .Plain) { input in
            
        }
    }
    
    @IBAction func searchCat() {
        search("cat")
    }
    
    @IBAction func searchDog() {
        search("dog")
    }
    
    @IBAction func searchBeer() {
        search("beer")
    }
    
    @IBAction func searchDance() {
        search("dance")
    }
    
    @IBAction func searchEpic() {
        search("epic")
    }
    
    @IBAction func searchFail() {
        search("fail")
    }
    
    @IBAction func searchJump() {
        search("jump")
    }
    
    // This is gold!!!
    @IBAction func searchNicolasCage() {
        search("nicolas cage")
    }
    
    @IBAction func searchNinja() {
        search("ninja")
    }
    
    @IBAction func searchPanda() {
        search("panda")
    }
    
    @IBAction func searchParty() {
        search("party")
    }
    
    @IBAction func searchReaction() {
        search("reaction")
    }
    
    @IBAction func searchSmile() {
        search("smile")
    }
    
    @IBAction func searchWelcome() {
        search("welcome")
    }
    
}
