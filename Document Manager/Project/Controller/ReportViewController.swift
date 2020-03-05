//
//  ReportViewController.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/1/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {
    
    var reportDocList = [Document]()
    @IBOutlet weak var docNumber: UILabel!
    
    @IBOutlet private var chartView: MacawChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chartView.contentMode = .scaleAspectFit
        
        let tabBar = tabBarController as! BaseTabBarController
        reportDocList = tabBar.fullDocumentList
        print("VDL w Report \(reportDocList.count)")
        docNumber.text = String(reportDocList.count)
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        docNumber.text = String(docList.count)
//        docNumber.text = String(reportDocList.count)
        let tabBar = tabBarController as! BaseTabBarController
        reportDocList = tabBar.fullDocumentList
        print("VWA w Report \(reportDocList.count)")
        docNumber.text = String(reportDocList.count)
    }

    @IBAction func showChartButtonTapped(_ sender: UIButton) {
        MacawChartView.playAnimations()
    }
}
