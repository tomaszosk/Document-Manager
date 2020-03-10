//
//  SearchCollectionViewController.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/4/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit

class SearchCollectionViewController: UIViewController {
    
    var searchDocList = [Document]()
    var documentName: String!
    
    var collectionView: UICollectionView!
    
    
    
//    @IBOutlet weak var docsNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        
        let tabBar = tabBarController as! BaseTabBarController
        searchDocList = tabBar.fullDocumentList
//        docsNumber.text = String(searchDocList.count)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let tabBar = tabBarController as! BaseTabBarController
        searchDocList = tabBar.fullDocumentList
//        docsNumber.text = String(searchDocList.count)
    }

    func createThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .systemPink
        collectionView.register(DocumentCell.self, forCellWithReuseIdentifier: DocumentCell.reuseID)
    }

}
