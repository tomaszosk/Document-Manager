//
//  DocumentCell.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/10/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit

final class DocumentCell: UICollectionViewCell {
    static let reuseID = "DocumentCell"
    
    let frontImageView = DMFrontImageView(frame: .zero),
        documentLabel = DMTitleLabel(textAlignment: .center, fontSize: 12),
        padding: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(document: DocumentStruct) {
        documentLabel.text = document.name
        frontImageView.image = UIImage(data: document.image)
    }
    
    private func configure() {
        addSubview(frontImageView)
        addSubview(documentLabel)
        
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
