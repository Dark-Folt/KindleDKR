//
//  BookPagerController.swift
//  KindleDKR
//
//  Created by Kamil Ben on 08/01/2019.
//  Copyright © 2019 Dark Folt. All rights reserved.
//

import UIKit

class BookPagerController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var book: Book?
    let defaults = UserDefaults.standard
    
    fileprivate let cellID = "SF"
    //La reference à mon userdefaults
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupCollectionView()
    
    }
    
    
    private func setupCollectionView(){
        collectionView.backgroundColor = UIColor.white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellID)
        
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.scrollDirection = .horizontal
        layout?.minimumLineSpacing = 0 //Reduire les espages entre les pages
        collectionView.isPagingEnabled = true //Pagination OK
    }
    
    private func setupNavigationController(){
        navigationItem.title = book?.title
        navigationController?.navigationBar.backgroundColor = Theme.currentTheme.backgroundColor
    }
    
    
    //MARK: Delegate methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = ((view.frame.height) - 64)
        let width = view.frame.width
        return CGSize(width: width, height: height)
    }
    
    
    
    //MARK: CollectionView Methodes
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return book?.pages.count ?? 0 //Je retourne le nombre de page dispo dans mon book
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PageCell
        let currentBook = book?.pages[indexPath.row]

        pageCell.backgroundColor = Theme.currentTheme.backgroundColor
        pageCell.textLabel.textColor = Theme.currentTheme.fontColor
        pageCell.textLabel.text = currentBook?.text
        return pageCell
    }
}
