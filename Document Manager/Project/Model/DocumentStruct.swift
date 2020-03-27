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
    var category: Category
    
    enum Category: Codable {
        case all
        case facture
        case reciept
        case summary
        case report
    }
    
    public init(name: String, type: String, dateAdded: String, image: UIImage, category: Category) {
        self.name = name
        self.type = type
        self.dateAdded = dateAdded
        self.image = image.pngData()!
        self.category = category
    }
}

extension DocumentStruct.Category: CaseIterable { }

extension DocumentStruct.Category: RawRepresentable {
  typealias RawValue = String
  
  init?(rawValue: RawValue) {
    switch rawValue {
        case "Wszystkie": self = .all
        case "Faktura": self = .facture
        case "Paragon": self = .reciept
        case "Protokół": self = .summary
        case "Raport": self = .report
        default: return nil
    }
  }
  
  var rawValue: RawValue {
    switch self {
        case .all: return "Wszystkie"
        case .facture: return "Faktura"
        case .reciept: return "Paragon"
        case .summary: return "Protokół"
        case .report: return "Raport"
    }
  }
}
