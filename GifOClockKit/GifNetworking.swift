//
//  GifNetworking.swift
//  GifOClock
//
//  Created by Pavel Dusatko on 2015-03-26.
//  Copyright (c) 2015 Themis Solutions Inc. All rights reserved.
//

import Foundation

let baseURL = NSURL(string:"http://api.giphy.com/v1/gifs/")!
let apiKey = "dc6zaTOxFJmzC"
let limit = "100"

public typealias Gifs = [Gif]

func defaultFailureHandler(failureReason: Reason, data: NSData?) {
    let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
    println("Failure: \(failureReason) \(string)")
}

func search(text: String) -> Resource<Gifs> {
    let parameters = ["api_key": apiKey, "limit": limit, "q": text]
    return jsonResource("search", .GET, parameters, parseSearch)
}

public func gifSearch(text: String, completion: (Gifs) -> ()) {
    apiRequest(baseURL, search(text), defaultFailureHandler) { completion($0) }
}
