//
//  DocumentStruct.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/10/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit

struct DocumentStruct: Codable, Hashable {
    
    var name: String
    var type: String
    var dateAdded: String
    var image: Data
    
    public init(name: String, type: String, dateAdded: String, image: UIImage) {
        self.name = name
        self.type = type
        self.dateAdded = dateAdded
        self.image = image.pngData()!
    }
}
