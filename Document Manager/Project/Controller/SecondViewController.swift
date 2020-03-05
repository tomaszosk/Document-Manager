//
//  SecondViewController.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 10/20/19.
//  Copyright © 2019 Tomasz Oskroba. All rights reserved.
//

import UIKit
//import Macaw

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddDoc {
    
    var docList: [Document] = []
    
    @IBOutlet weak var docTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBar = tabBarController as! BaseTabBarController
        docList = tabBar.fullDocumentList
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let tabBar = tabBarController as! BaseTabBarController
        tabBar.fullDocumentList = docList
    }
    
    // MARK: Table View Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (docList.count)
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = docList[indexPath.row].name
        
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete{
            self.docList.remove(at: indexPath.row)
            docTableView.reloadData()
        }
        
    }
    
    // MARK: Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddDocTableViewController
        vc.delegate = self
    }
    
    func addDoc(document: Document) {
        docList.append(document)
        docTableView.reloadData()
    }
}

