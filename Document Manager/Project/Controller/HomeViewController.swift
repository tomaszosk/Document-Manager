//
//  FirstViewController.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 10/20/19.
//  Copyright © 2019 Tomasz Oskroba. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let logoLabel = DMTitleLabel(textAlignment: .center, fontSize: 46)
    let locationLabel = DMTitleLabel(textAlignment: .center, fontSize: 20)
    let appLogoImage = DMFrontImageView(frame: .zero)
    let descriptionLabel = DMBodyLabel(textAlignment: .left)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTheView()
        setLabels()
    }
    
    private func configureTheView() {
        view.addSubview(logoLabel)
        view.addSubview(locationLabel)
        view.addSubview(appLogoImage)
        view.addSubview(descriptionLabel)
        
        appLogoImage.image = UIImage(named: "image-3")!
        appLogoImage.contentMode = .scaleAspectFit
        
        descriptionLabel.backgroundColor = .systemGray5
        descriptionLabel.alpha = 0.9
        descriptionLabel.layer.cornerRadius = 10
        descriptionLabel.layer.masksToBounds = true
        descriptionLabel.numberOfLines = 0
        
        
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
            
            appLogoImage.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 30),
            appLogoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            appLogoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            appLogoImage.heightAnchor.constraint(equalToConstant: 100),
            
            descriptionLabel.topAnchor.constraint(equalTo: appLogoImage.bottomAnchor, constant: 50),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 400)
        ])
        
    }
    
    private func setLabels() {
        
        let attributedString = NSMutableAttributedString.init(string: "Junkers-Bosch")
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
            NSRange.init(location: 0, length: attributedString.length));
        logoLabel.attributedText = attributedString
        
        locationLabel.text = "Oddział Warszawa-Targówek"
        descriptionLabel.text = """
            Sposób dodawania dokumentów:
        
                1. Wypełnić pole wg:
                Nazwisko_Imię(Klienta)
        
                2. Wybrać typ dokumentu
        
                3. Zrobić zdjęcie (skan) dokumentu,
                    bądź wybrać z rolki aparatu
        
                4. Wybrać datę utworzenia
        
                5. [OPCJONALNE] Udostępnienie
                    (np. poprzez mail)
        
                6. Dodać w aplikacji przyciskiem
                    w prawym górnym rogu
        """
    }

}

