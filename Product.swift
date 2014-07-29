//
//  Product.swift
//  navigation
//
//  Created by Jose Ramon 👾 on 7/24/14.
//  Copyright (c) 2014 CoDN. All rights reserved.
//

import Foundation

class Product: NSObject {
    var name: NSString = "🙊🙈🙉"
    
//    init() {
//        self.name = "💩"
//        println("name of product has been changed")
//    }
    
    init(newName: NSString){
        self.name = newName
    }
    
}
