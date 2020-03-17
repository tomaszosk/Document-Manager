//
//  BarReportViewController.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/15/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit

class BarReportViewController: UIViewController, UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView!
//    var dataSource: UICollectionViewDataSource
    let values: [CGFloat] = [5, 6, 4, 1, 3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureDataSource()
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.delegate = self as? UICollectionViewDelegate
        collectionView.backgroundColor = .systemPink
        collectionView.register(ReportBarCell.self, forCellWithReuseIdentifier: ReportBarCell.reuseID)
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
    
    func configureDataSource() {
        
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
    }
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return values.count
    }
    
    func maxHeight() -> CGFloat {
//        return view.frame.height - 20 - 44 - 8
        return view.frame.height - 400
    }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReportBarCell.reuseID, for: indexPath) as! BarCell
        
        if let max = values.max() {
            let value = values[indexPath.item]
            let ratio = value / max
            
            cell.barHeightConstraint?.constant = maxHeight() * ratio
//            cell.layer.cornerRadius = 20
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 100 ) / 5, height: maxHeight())
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 200, left: 20, bottom: 0, right: 20)
    }
    }

}
