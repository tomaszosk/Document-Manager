//
//  AddDocControllerViewController.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 10/21/19.
//  Copyright © 2019 Tomasz Oskroba. All rights reserved.
//

import UIKit

//protocol AddDoc {
//    func addDoc(document: Document)
//}

class AddDocControllerViewController: UIViewController {

    @IBOutlet weak var docNameOutlet: UITextField!
    var newDocument: Document = Document(name: "", size: 0, dateAdded: "", privacy: "")
    
    var delegate: AddDoc?
    
    @IBAction func AddDocument(_ sender: UIBarButtonItem) {
        if docNameOutlet.text != "" {
            newDocument.name = docNameOutlet.text!
            delegate?.addDoc(document: newDocument)
            navigationController?.popViewController(animated: true)
        }
    }
    @IBAction func AddDocAction(_ sender: UIButton) {
        if docNameOutlet.text != "" {
            newDocument.name = docNameOutlet.text!
            delegate?.addDoc(document: newDocument)
            navigationController?.popViewController(animated: true)
        }
    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }

}
