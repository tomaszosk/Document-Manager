//
//  Codable.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/9/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import Foundation

class Document1: Codable {
    var name: String
//    var size: Int
    var type: String
    var dateAdded: String
//    var privacy: String
//    var image = UIImage()
//    var image = UIImage(named: "")
    
    init(name: String, type: String, dateAdded: String) {
        self.name = name
//        self.size = size
        self.type = type
        self.dateAdded = dateAdded
//        self.privacy = privacy
//        self.image = image
    }
}
