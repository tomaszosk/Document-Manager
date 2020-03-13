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
    
    var doc1: DocumentStruct = DocumentStruct(name: "Dokument 1", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!)
    var doc2: DocumentStruct = DocumentStruct(name: "Dokument 2", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!)
    var doc3: DocumentStruct = DocumentStruct(name: "Dokument 3", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!)
    var doc4: DocumentStruct = DocumentStruct(name: "Dokument 4", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!)
    
    var fullDocumentList: [DocumentStruct] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fullDocumentList.append(doc1)
        fullDocumentList.append(doc2)
        fullDocumentList.append(doc3)
        fullDocumentList.append(doc4)
//        print(fullDocumentList)
        // Do any additional setup after loading the view.
    }

}
