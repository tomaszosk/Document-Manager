//
//  DMListViewCell.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/28/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit

class DMListViewCell: UIView {
    
    let docLabel = DMTitleLabel(textAlignment: .left, fontSize: 20)
    let docNumber = DMTitleLabel(textAlignment: .right, fontSize: 24)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(rowNumber: Int, docList: [DocumentStruct], category: DocumentStruct.Category) {
//        docLabel.text = String(category.rawValue)
//        docNumber.text = String(docList.count)
    }
    
    private func setupView() {
        backgroundColor = Colors.orange
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(docLabel)
        addSubview(docNumber)
        
        docLabel.textColor = .black
        docNumber.textColor = .black
//        docLabel.backgroundColor = .systemPink
//        docNumber.backgroundColor = .systemGray
        
        docLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        docNumber.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        let halfOfTheScreen = bounds.width / 2
        
        NSLayoutConstraint.activate([
            docLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            docLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            docLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -110),
            docLabel.heightAnchor.constraint(equalToConstant: 50),
            
            docNumber.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            docNumber.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 300),
            docNumber.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            docNumber.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
