//
//  EventFormatter.swift
//  laravel-echo-ios
//
//  Created by valentin vivies on 21/07/2017.
//  Copyright © 2017 Bubbleflat. All rights reserved.
//

import Foundation

class EventFormatter {
    
    var namespace = ""
    
    init(namespace: String? = ""){
        self.setNamespace(value: namespace!)
    }
    
    func format(event: String) -> String {
        var e : String = ""
        if(!(event.hasPrefix("\\") || event.hasPrefix("."))){
            e = self.namespace + "." + event
        } else {
            let index = event.index(event.startIndex, offsetBy: 1)
            return event.substring(from: index)
        }
        return e.replacingOccurrences(of: ".", with: "\\")
    }
    
    func setNamespace(value: String? = "") {
        if let wrap = value {
            self.namespace = wrap;
        }
    }
    
}
