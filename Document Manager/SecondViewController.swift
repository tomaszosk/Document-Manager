//
//  SecondViewController.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 10/20/19.
//  Copyright © 2019 Tomasz Oskroba. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let docList = ["Dokument 1", "Dokument 2", "Dokument 3", "Dokument 4"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (docList.count)
    }


    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = docList[indexPath.row]
        
        return(cell)
    }

    @IBOutlet weak var docTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

