//
//  ReportBarCell.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/15/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit

class ReportBarCell: UICollectionViewCell {
    static let reuseID = "ReportBarCell"
    
    let barNameLabel = DMTitleLabel(textAlignment: .center, fontSize: 12)
    let barCountLabel = DMTitleLabel(textAlignment: .center, fontSize: 16)
    let barView = BarView(backgroundColor: Colors.orange)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(document: DocumentStruct) {
        barCountLabel.text = "0"
        barNameLabel.text = "Name"
    }
    
    private func configure() {
        addSubview(barCountLabel)
        addSubview(barView)
        addSubview(barNameLabel)
        
        let padding: CGFloat = 8
        
        barView.layer.cornerRadius = 10
        barView.layer.masksToBounds = true
        barView.setGradientBackground(colorOne: Colors.orange, colorTwo: Colors.brightOrange)
        
        NSLayoutConstraint.activate([
            barCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            barCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            barCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            barCountLabel.heightAnchor.constraint(equalToConstant: 20),
            
            barView.topAnchor.constraint(equalTo: barCountLabel.bottomAnchor, constant: 12),
            barView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            barView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            barView.heightAnchor.constraint(equalToConstant: 300),
            
            barNameLabel.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 12),
            barNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            barNameLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: -padding),
            barNameLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
}
