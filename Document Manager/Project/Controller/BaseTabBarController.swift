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
    var doc5: DocumentStruct = DocumentStruct(name: "Dokument 5", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!)
    var doc6: DocumentStruct = DocumentStruct(name: "Dokument 6", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!)
    var doc7: DocumentStruct = DocumentStruct(name: "Dokument 7", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!)
    var doc8: DocumentStruct = DocumentStruct(name: "Dokument 8", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!)
    var doc9: DocumentStruct = DocumentStruct(name: "Dokument 9", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!)
    var doc10: DocumentStruct = DocumentStruct(name: "Dokument 10", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!)
    var doc11: DocumentStruct = DocumentStruct(name: "Dokument 11", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!)
    var doc12: DocumentStruct = DocumentStruct(name: "Dokument 12", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!)
    var doc13: DocumentStruct = DocumentStruct(name: "Dokument 13", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!)
    
    
    var fullDocumentList: [DocumentStruct] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fullDocumentList.append(doc1)
        fullDocumentList.append(doc2)
        fullDocumentList.append(doc3)
        fullDocumentList.append(doc4)
        fullDocumentList.append(doc5)
        fullDocumentList.append(doc6)
        fullDocumentList.append(doc7)
        fullDocumentList.append(doc8)
        fullDocumentList.append(doc9)
        fullDocumentList.append(doc10)
        fullDocumentList.append(doc11)
        fullDocumentList.append(doc12)
        fullDocumentList.append(doc13)
        
//        print(fullDocumentList)
        // Do any additional setup after loading the view.
    }

}
