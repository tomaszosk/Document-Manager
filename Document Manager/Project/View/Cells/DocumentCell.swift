//
//  DocumentCell.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/10/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit

class DocumentCell: UICollectionViewCell {
    static let reuseID = "DocumentCell"
    
    let frontImageView = DMFrontImageView(frame: .zero)
    let documentLabel = DMTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func ser(document: Document) {
        documentLabel.text = document.name
    }
    
    private func configure() {
        addSubview(frontImageView)
        addSubview(documentLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            frontImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            frontImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            frontImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            frontImageView.heightAnchor.constraint(equalTo: frontImageView.widthAnchor),
            
            documentLabel.topAnchor.constraint(equalTo: frontImageView.bottomAnchor, constant: 12),
            documentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            documentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            documentLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}