//
//  DMListView.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/28/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit

class DMListView: UIView {
    
    let descriptionLabel = DMTitleLabel(textAlignment: .left, fontSize: 18)
    let firstCell = DMListViewCell()
    let secondCell = DMListViewCell()
    let thirdCell = DMListViewCell()
    let fourthCell = DMListViewCell()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
//        backgroundColor = Colors.orange
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(descriptionLabel)
        addSubview(firstCell)
        addSubview(secondCell)
        addSubview(thirdCell)
        addSubview(fourthCell)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 40),
            
            firstCell.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 0),
            firstCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            firstCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            firstCell.heightAnchor.constraint(equalToConstant: 75),
            
            secondCell.topAnchor.constraint(equalTo: firstCell.bottomAnchor, constant: 20),
            secondCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            secondCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            secondCell.heightAnchor.constraint(equalToConstant: 75),
            
            thirdCell.topAnchor.constraint(equalTo: secondCell.bottomAnchor, constant: 20),
            thirdCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            thirdCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            thirdCell.heightAnchor.constraint(equalToConstant: 75),
            
            fourthCell.topAnchor.constraint(equalTo: thirdCell.bottomAnchor, constant: 20),
            fourthCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            fourthCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            fourthCell.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    private func setLabels() {
        descriptionLabel.text = "Liczba dokumentów z podziałem na rodzaj:"
    }
}
