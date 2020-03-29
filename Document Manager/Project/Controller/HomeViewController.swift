//
//  FirstViewController.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 10/20/19.
//  Copyright © 2019 Tomasz Oskroba. All rights reserved.
//

import UIKit
//import Macaw

class HomeViewController: UIViewController {
    
    let logoLabel = DMTitleLabel(textAlignment: .center, fontSize: 46)
    let locationLabel = DMTitleLabel(textAlignment: .center, fontSize: 24)
    let descriptionLabel = DMBodyLabel(textAlignment: .left)
    let addFromFileButton = DMButton(backgroundColor: Colors.blue, title: "+")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTheView()
        setLabels()
    }
    
    private func configureTheView() {
        view.addSubview(logoLabel)
        view.addSubview(locationLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(addFromFileButton)
        
        logoLabel.backgroundColor = Colors.veryDarkGray
        locationLabel.backgroundColor = Colors.darkGrey
        descriptionLabel.backgroundColor = Colors.lightGray
        descriptionLabel.layer.cornerRadius = 10
        descriptionLabel.layer.masksToBounds = true
        descriptionLabel.numberOfLines = 0
        
        logoLabel.textColor = .white
        locationLabel.textColor = .white
        descriptionLabel.textColor = .black
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            logoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            logoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            logoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            logoLabel.heightAnchor.constraint(equalToConstant: 50),
            
            locationLabel.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 20),
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            locationLabel.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 80),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 400),
            
            addFromFileButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50),
            addFromFileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            addFromFileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            addFromFileButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
    }
    
    private func setLabels() {
        logoLabel.text = "Junkers - Bosch"
        locationLabel.text = "Oddział Warszawa-Targówek"
        descriptionLabel.text = """
            1. Wskazówki
            2. Jakiś opic
            3. Cos tam jeszcze
        """
    }

}

