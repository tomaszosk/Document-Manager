//
//  ReportViewController.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/1/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {
    
    var docList: [String] = []
    
    @IBOutlet private var chartView: MacawChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chartView.contentMode = .scaleAspectFit
        
        let tabBar = tabBarController as! BaseTabBarController
        docList = [String](tabBar.fullDocumentList)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    @IBAction func showChartButtonTapped(_ sender: UIButton) {
        MacawChartView.playAnimations()
    }
}
