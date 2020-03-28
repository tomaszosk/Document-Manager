//
//  BarReportViewController.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/15/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit

class BarReportViewController: UIViewController, UINavigationControllerDelegate {
    
    var docList: [DocumentStruct] = []
    
    let topMargin = UIView()
    let reportTitleLabel = DMTitleLabel(textAlignment: .center, fontSize: 36)
    let countHeaderLabel = DMTitleLabel(textAlignment: .center, fontSize: 24)
    let countHeaderNumber = DMTitleLabel(textAlignment: .center, fontSize: 42)
    
    let allDocumentsTypesView = DMListView()
    
    var factureList: [DocumentStruct] = []
    var recieptList: [DocumentStruct] = []
    var reportList: [DocumentStruct] = []
    var summaryList: [DocumentStruct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBar()
        for documentCategorized in docList {
            if documentCategorized.category == .facture {
                factureList.append(documentCategorized)
            } else if documentCategorized.category == .reciept {
                recieptList.append(documentCategorized)
            } else if documentCategorized.category == .report {
                reportList.append(documentCategorized)
            } else if documentCategorized.category == .summary {
                summaryList.append(documentCategorized)
            }
        }
        

        configureTheView()

        setLabels()
    }

    private func configureTheView() {
        view.addSubview(topMargin)
        topMargin.addSubview(reportTitleLabel)
        
        topMargin.backgroundColor = Colors.brightOrange
        topMargin.translatesAutoresizingMaskIntoConstraints = false
        reportTitleLabel.textColor = .white
        
        view.addSubview(countHeaderLabel)
        view.addSubview(countHeaderNumber)
        
        
        view.addSubview(allDocumentsTypesView)
        allDocumentsTypesView.firstCell.set(rowNumber: 0, docList: docList, category: DocumentStruct.Category.facture)

        
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
            countHeaderLabel.heightAnchor.constraint(equalToConstant: 50),
            
            countHeaderNumber.topAnchor.constraint(equalTo: countHeaderLabel.bottomAnchor, constant: 20),
            countHeaderNumber.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            countHeaderNumber.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            countHeaderNumber.heightAnchor.constraint(equalToConstant: 50),
            
            allDocumentsTypesView.topAnchor.constraint(equalTo: countHeaderNumber.bottomAnchor, constant: 30),
            allDocumentsTypesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            allDocumentsTypesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            allDocumentsTypesView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    private func setLabels() {
        reportTitleLabel.text = "Raport"
        countHeaderLabel.text = "Liczba wszystkich dokumentów:"
        countHeaderNumber.text = String(docList.count)
        allDocumentsTypesView.firstCell.docLabel.text = "Faktury:"
        allDocumentsTypesView.firstCell.docNumber.text = String(reportList.count)
        allDocumentsTypesView.secondCell.docLabel.text = "Paragony:"
        allDocumentsTypesView.secondCell.docNumber.text = String(recieptList.count)
        allDocumentsTypesView.thirdCell.docLabel.text = "Protokoły:"
        allDocumentsTypesView.thirdCell.docNumber.text = String(reportList.count)
        allDocumentsTypesView.fourthCell.docLabel.text = "Raporty końcowe:"
        allDocumentsTypesView.fourthCell.docNumber.text = String(summaryList.count)
//        firstDocTypeLabel.text = DocumentStruct.Category.facture.rawValue
        
    }
    
    private func configureTabBar() {
        let tabBar = tabBarController as! BaseTabBarController
        docList = tabBar.fullDocumentList
    }
}
