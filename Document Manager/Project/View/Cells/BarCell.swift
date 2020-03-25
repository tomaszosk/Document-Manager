//
//  BarCell.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/8/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit

class BarCell: UICollectionViewCell {
    
    let barNameLabel = DMTitleLabel(textAlignment: .center, fontSize: 12)
    let barCountLabel = DMTitleLabel(textAlignment: .center, fontSize: 16)
    
    let barView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.brightOrange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var barHeightConstraint: NSLayoutConstraint?
//    barHeightConstraint = barView.bottomAnchor.constraint(equalToConstant: 300)
    
    override var isHighlighted: Bool {
        didSet {
            barView.backgroundColor = isHighlighted ? Colors.orange : Colors.brightOrange
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        


//

//
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(document: DocumentStruct) {
        barCountLabel.text = "0"
        barNameLabel.text = "Faktura"
    }
    
    private func configure() {
        addSubview(barCountLabel)
        addSubview(barView)
        addSubview(barNameLabel)
        
        let padding: CGFloat = 8
        
        barView.layer.cornerRadius = 10
        barView.layer.masksToBounds = true
        barView.setGradientBackground(colorOne: Colors.orange, colorTwo: Colors.brightOrange)
        
                barView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//                configure()
//
//                barView.layer.cornerRadius = 10
//                barView.layer.masksToBounds = true
//                barView.setGradientBackground(colorOne: Colors.orange, colorTwo: Colors.brightOrange)
        
                barHeightConstraint = barView.heightAnchor.constraint(equalToConstant: 300)
        
        
                barHeightConstraint?.isActive = true
                barHeightConstraint?.constant = 100
        
                barView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
                barView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
                barView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            barCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            barCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            barCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            barCountLabel.heightAnchor.constraint(equalToConstant: 20),
            
//            barView.topAnchor.constraint(equalTo: barCountLabel.bottomAnchor, constant: 12),
//            barView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
//            barView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
//            barView.heightAnchor.constraint(equalToConstant: 300),
            
            barNameLabel.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 12),
            barNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            barNameLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: -padding),
            barNameLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
    
}
