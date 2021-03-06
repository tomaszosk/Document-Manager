//
//  SearchCollectionViewController.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/4/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit

final class SearchCollectionViewController: UIViewController {
    
    enum Section { case main }
    
    var searchDocList = [DocumentStruct](),
        filteredDocuments: [DocumentStruct] = [],
        documentName: String!,
        isSearching = false,
        collectionView: UICollectionView!,
        dataSource: UICollectionViewDiffableDataSource<Section, DocumentStruct>!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        configureSearchViewController()
        configureCollectionView()
        configureDataSource()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        configureTabBar()
        updateData(on: searchDocList)
    }
    
    private func configureTabBar() {
        let tabBar = tabBarController as! BaseTabBarController
        searchDocList = tabBar.fullDocumentList
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
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.delegate = self as? UICollectionViewDelegate
        collectionView.backgroundColor = .systemBackground
        collectionView.register(DocumentCell.self, forCellWithReuseIdentifier: DocumentCell.reuseID)
    }
    
    private func configureSearchViewController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.scopeButtonTitles = DocumentStruct.Category.allCases.map { $0.rawValue }
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Szukaj dokumentu"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 60)
        
        navigationItem.searchController = searchController
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, DocumentStruct>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, document) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DocumentCell.reuseID, for: indexPath) as! DocumentCell
            cell.set(document: document)
            
            return cell
        })
    }
    
}

extension SearchCollectionViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    var isSearchBarEmpty: Bool { return searchController.searchBar.text?.isEmpty ?? true }
    
    func updateData(on searchDocList: [DocumentStruct]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, DocumentStruct>()
        snapshot.appendSections([.main])
        snapshot.appendItems(searchDocList)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    func filterContentForSearchText(_ searchText: String, category: DocumentStruct.Category? = nil) {
      filteredDocuments = searchDocList.filter { (document: DocumentStruct) -> Bool in
        let doesCategoryMatch = category == .all || document.category == category
        
        switch isSearchBarEmpty {
        case true:
            return doesCategoryMatch
        case false:
            return doesCategoryMatch && document.name.lowercased().contains(searchText.lowercased())
        }
      }
      updateData(on: searchDocList)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
        isSearching = true
        
        let searchBar = searchController.searchBar
        let category = DocumentStruct.Category(rawValue: searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex])
        filterContentForSearchText(searchBar.text!, category: category)
        
        filteredDocuments = searchDocList.filter { $0.name.lowercased().contains(filter.lowercased()) }
        updateData(on: filteredDocuments)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        updateData(on: searchDocList)
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        let category = DocumentStruct.Category(rawValue:
        searchBar.scopeButtonTitles![selectedScope])
        filterContentForSearchText(searchBar.text!, category: category)
        updateData(on: filteredDocuments)
    }
}
