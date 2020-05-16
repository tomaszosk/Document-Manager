//
//  DMListView.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/28/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit

final class DMListView: UIView {
    
    let descriptionLabel = DMTitleLabel(textAlignment: .left, fontSize: 18),
        firstCell = DMListViewCell(),
        secondCell = DMListViewCell(),
        thirdCell = DMListViewCell(),
        fourthCell = DMListViewCell()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(descriptionLabel)
        addSubview(firstCell)
        addSubview(secondCell)
        addSubview(thirdCell)
        addSubview(fourthCell)
        
        let padding: CGFloat = 20
        let cellHeight: CGFloat = 60
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 40),
            
            firstCell.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            firstCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            firstCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            firstCell.heightAnchor.constraint(equalToConstant: cellHeight),
            
            secondCell.topAnchor.constraint(equalTo: firstCell.bottomAnchor, constant: 20),
            secondCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            secondCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            secondCell.heightAnchor.constraint(equalToConstant: cellHeight),
            
            thirdCell.topAnchor.constraint(equalTo: secondCell.bottomAnchor, constant: 20),
            thirdCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            thirdCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            thirdCell.heightAnchor.constraint(equalToConstant: cellHeight),
            
            fourthCell.topAnchor.constraint(equalTo: thirdCell.bottomAnchor, constant: 20),
            fourthCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            fourthCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            fourthCell.heightAnchor.constraint(equalToConstant: cellHeight)
        ])
    }
    
    private func setLabels() {
        descriptionLabel.text = "Liczba dokumentów z podziałem na rodzaj:"
    }
}
