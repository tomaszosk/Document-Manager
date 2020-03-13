//
//  SearchCollectionViewController.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/4/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit

class SearchCollectionViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    var searchDocList = [DocumentStruct]()
    var filteredDocuments: [DocumentStruct] = []
    var documentName: String!
    var isSearching = false
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, DocumentStruct>!
    
    
//    @IBOutlet weak var docsNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(searchDocList)
//        updateData()
//        print(searchDocList)
        configureCollectionView()
        configureDataSource()
        
        let tabBar = tabBarController as! BaseTabBarController
        searchDocList = tabBar.fullDocumentList
//        docsNumber.text = String(searchDocList.count)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let tabBar = tabBarController as! BaseTabBarController
        searchDocList = tabBar.fullDocumentList
        updateData()
//        print(tabBar.fullDocumentList)
//        print(searchDocList)
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
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, DocumentStruct>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, document) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DocumentCell.reuseID, for: indexPath) as! DocumentCell
            cell.set(document: document)
            
            return cell
        })
    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, DocumentStruct>()
        snapshot.appendSections([.main])
        snapshot.appendItems(searchDocList)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
        
    }
    
    func updateData(on searchDocList: [DocumentStruct]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, DocumentStruct>()
        snapshot.appendSections([.main])
        snapshot.appendItems(searchDocList)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for a username"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
}

extension SearchCollectionViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
        isSearching = true
        
        filteredDocuments = searchDocList.filter { $0.name.lowercased().contains(filter.lowercased()) }
        updateData(on: filteredDocuments)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        updateData(on: searchDocList)
    }
}
