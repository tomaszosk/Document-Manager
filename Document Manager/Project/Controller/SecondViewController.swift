//
//  SecondViewController.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 10/20/19.
//  Copyright © 2019 Tomasz Oskroba. All rights reserved.
//

import UIKit
import Macaw

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddDoc {
    
//    var docList = ["Dokument 1", "Dokument 2", "Dokument 3", "Dokument 4"]
    var docList: [Document] = []
    
    
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
    
    
    @IBOutlet weak var docTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBar = tabBarController as! BaseTabBarController
//        docList = [String](tabBar.fullDocumentList)
        docList = tabBar.fullDocumentList
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        let tabBar = tabBarController as! BaseTabBarController
//        docList = [String](tabBar.fullDocumentList)


    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let tabBar = tabBarController as! BaseTabBarController
//        tabBar.fullDocumentList = [String](docList)
        tabBar.fullDocumentList = docList

    }
    
    override func viewDidDisappear(_ animated: Bool) {
                let tabBar = tabBarController as! BaseTabBarController
        //        tabBar.fullDocumentList = [String](docList)
                tabBar.fullDocumentList = docList
  
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddDocControllerViewController
        vc.delegate = self
    }
    
    
    func addDoc(document: Document) {
        docList.append(document)
        docTableView.reloadData()
    }


}

