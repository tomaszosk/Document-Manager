//
//  DMFrontImageView.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/10/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit

final class DMFrontImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "blankphoto")!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
