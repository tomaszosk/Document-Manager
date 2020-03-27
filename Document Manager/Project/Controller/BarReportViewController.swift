//
//  BarReportViewController.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/15/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit

class BarReportViewController: UIViewController {
    
    let topMargin = UIView()
    let reportTitleLabel = DMTitleLabel(textAlignment: .center, fontSize: 36)
    let countHeaderLabel = DMTitleLabel(textAlignment: .center, fontSize: 24)
    let countHeaderNumber = DMTitleLabel(textAlignment: .center, fontSize: 42)
    let firstDocTypeLabel = DMTitleLabel(textAlignment: .left, fontSize: 18)
    let firstDocTypeNumber = DMTitleLabel(textAlignment: .right, fontSize: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setLabels()
    }

    func configure() {
        view.addSubview(topMargin)
        topMargin.addSubview(reportTitleLabel)
        
        view.addSubview(countHeaderLabel)
        view.addSubview(countHeaderNumber)

        topMargin.backgroundColor = Colors.brightOrange
        topMargin.translatesAutoresizingMaskIntoConstraints = false
        reportTitleLabel.textColor = .white
        
        NSLayoutConstraint.activate([
            topMargin.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            topMargin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            topMargin.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            topMargin.heightAnchor.constraint(equalToConstant: 100),
            
            reportTitleLabel.topAnchor.constraint(equalTo: topMargin.bottomAnchor, constant: -70),
            reportTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            reportTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            reportTitleLabel.heightAnchor.constraint(equalToConstant: 70),
            
            countHeaderLabel.topAnchor.constraint(equalTo: topMargin.bottomAnchor, constant: 30),
            countHeaderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            countHeaderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            countHeaderLabel.heightAnchor.constraint(equalToConstant: 60),
            
            countHeaderNumber.topAnchor.constraint(equalTo: countHeaderLabel.bottomAnchor, constant: 0),
            countHeaderNumber.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            countHeaderNumber.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            countHeaderNumber.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setLabels() {
        reportTitleLabel.text = "Raport"
        countHeaderLabel.text = "Liczba wszystkich dokumentów:"
        countHeaderNumber.text = "7"
        firstDocTypeLabel.text = DocumentStruct.Category.facture.rawValue
        
    }
}
