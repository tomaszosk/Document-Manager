//
//  BarReportViewController.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/15/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit

final class BarReportViewController: UIViewController, UINavigationControllerDelegate {
    
    var docList: [DocumentStruct] = [],
        factureList: [DocumentStruct] = [],
        recieptList: [DocumentStruct] = [],
        reportList: [DocumentStruct] = [],
        summaryList: [DocumentStruct] = []
    
    let topMargin = UIView(),
        reportTitleLabel = DMTitleLabel(textAlignment: .center, fontSize: 36),
        countHeaderLabel = DMTitleLabel(textAlignment: .center, fontSize: 24),
        countHeaderNumber = DMTitleLabel(textAlignment: .center, fontSize: 42),
        allDocumentsTypesView = DMListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        configureTheView()
        setLabels()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        configureTabBar()
        setLabels()
    }

    private func configureTheView() {
        view.addSubview(topMargin)
        topMargin.addSubview(reportTitleLabel)
        
        topMargin.backgroundColor = .darkGray
        topMargin.translatesAutoresizingMaskIntoConstraints = false
        reportTitleLabel.textColor = .black
        
        view.addSubview(countHeaderLabel)
        view.addSubview(countHeaderNumber)
        
        
        view.addSubview(allDocumentsTypesView)
        
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
        reportTitleLabel.text = "Podsumowanie"
        countHeaderLabel.text = "Liczba wszystkich dokumentów:"
        countHeaderNumber.text = String(docList.count)
        allDocumentsTypesView.firstCell.docLabel.text = "Faktury:"
        allDocumentsTypesView.firstCell.docNumber.text = String(factureList.count)
        allDocumentsTypesView.secondCell.docLabel.text = "Paragony:"
        allDocumentsTypesView.secondCell.docNumber.text = String(recieptList.count)
        allDocumentsTypesView.thirdCell.docLabel.text = "Protokoły:"
        allDocumentsTypesView.thirdCell.docNumber.text = String(reportList.count)
        allDocumentsTypesView.fourthCell.docLabel.text = "Raporty końcowe:"
        allDocumentsTypesView.fourthCell.docNumber.text = String(summaryList.count)
    }
    
    private func configureTabBar() {
        resetCountNumbers()
        let tabBar = tabBarController as! BaseTabBarController
        docList = tabBar.fullDocumentList
        updateCountNumbers()
    }
    
    private func updateCountNumbers() {
        for documentCategorized in docList {
            switch documentCategorized.category {
            case .facture:
                factureList.append(documentCategorized)
            case .reciept:
                recieptList.append(documentCategorized)
            case .report:
                reportList.append(documentCategorized)
            case .summary:
                summaryList.append(documentCategorized)
            default:
                return
            }
        }
    }
    
    private func resetCountNumbers() {
        factureList = []
        recieptList = []
        reportList = []
        summaryList = []
    }
}
