//
//  BaseTabBarController.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/4/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    var doc1: DocumentStruct = DocumentStruct(name: "Dokument 1", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!, category: .reciept)
    var doc2: DocumentStruct = DocumentStruct(name: "Dokument 2", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!, category: .report)
    var doc3: DocumentStruct = DocumentStruct(name: "Faktura 1", type: "Faktura", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!, category: .facture)
    var doc4: DocumentStruct = DocumentStruct(name: "Faktura 2", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!, category: .facture)
    var doc5: DocumentStruct = DocumentStruct(name: "Paragon", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!, category: .reciept)
    var doc6: DocumentStruct = DocumentStruct(name: "Protokol z instalacji", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!, category: .summary)
    var doc7: DocumentStruct = DocumentStruct(name: "Protokół serwisowy", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!, category: .summary)
    var doc8: DocumentStruct = DocumentStruct(name: "Sprawodzanie", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!, category: .summary)
    var doc9: DocumentStruct = DocumentStruct(name: "Raport końcowy 1", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!, category: .report)
    var doc10: DocumentStruct = DocumentStruct(name: "Raport końcowy 2", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!, category: .report)
    var doc11: DocumentStruct = DocumentStruct(name: "Protokol z instalacji 2", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!, category: .summary)
    var doc12: DocumentStruct = DocumentStruct(name: "Protokół serwisowy 2", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!, category: .summary)
    var doc13: DocumentStruct = DocumentStruct(name: "Raport końcowy 3", type: "Paragon", dateAdded: "dd/MM/yyyy", image: UIImage(named: "blankphoto")!, category: .report)
    
    
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
        
//        let fileName = "Test"
//        let documentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//        let fileURL = documentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")

//        print(fullDocumentList)
        // Do any additional setup after loading the view.
    }

}
