//
//  DMErrors.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/8/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import Foundation

enum DMError: String, Error {
    case nameTextFieldEmpty = "Dokument nie ma nazwy"
    case typeTextFieldEmpty = "Brak określonego typu dokumentu"
    case dateNotSet = "Data utworzenia jest pusta"
}
