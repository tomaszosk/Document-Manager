//
//  AddDocControllerViewController.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 10/21/19.
//  Copyright © 2019 Tomasz Oskroba. All rights reserved.
//

import UIKit

protocol AddDoc {
    func addDoc(name: String)
}

class AddDocControllerViewController: UIViewController {

    @IBOutlet weak var docNameOutlet: UITextField!
    
    var delegate: AddDoc?
    
    @IBAction func AddDocAction(_ sender: UIButton) {
        if docNameOutlet.text != "" {
            delegate?.addDoc(name: docNameOutlet.text!)
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
