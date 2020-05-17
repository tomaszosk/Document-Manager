//
//  BaseTabBarController.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/4/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit

final class BaseTabBarController: UITabBarController {
    
    var fullDocumentList: [DocumentStruct] = []


    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
