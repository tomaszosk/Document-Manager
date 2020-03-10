//
//  BaseTabBarController.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/4/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit
//import Macaw

class BaseTabBarController: UITabBarController {
    
    var doc1: Document = Document(name: "1", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!)
    var doc2: Document = Document(name: "2", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!)
    var doc3: Document = Document(name: "3", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!)
    var doc4: Document = Document(name: "4", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!)
    
    var fullDocumentList: [Document] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fullDocumentList.append(doc1)
        fullDocumentList.append(doc2)
        fullDocumentList.append(doc3)
        fullDocumentList.append(doc4)
        // Do any additional setup after loading the view.
    }

}
