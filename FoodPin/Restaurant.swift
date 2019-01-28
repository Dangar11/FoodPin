//
//  Restaurant.swift
//  FoodPin
//
//  Created by Igor Tkach on 5/21/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import Foundation

class Restaurant {
    
    var rating = ""
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var isVisited = false
    var phone = ""
    
    init(name: String, type: String, location: String, phone: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.image = image
        self.isVisited = isVisited
    }
}
