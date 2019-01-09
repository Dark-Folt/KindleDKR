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
    
    fileprivate let cellID = "SFQSDFSDQF"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    
    private func setupCollectionView(){
        navigationItem.title = book?.title
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellID)
        
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        
        layout?.scrollDirection = .horizontal
        layout?.minimumLineSpacing = 0 //Reduire les espages entre les pages
        
        collectionView.isPagingEnabled = true //Pagination OK
    }
    
    
    //MARK: Delegate methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height)-64
        let width = view.frame.width
        return CGSize(width: width, height: height)
    }
    
    
    
    //MARK: CollectionView Methodes
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PageCell 
        return cell
    }
}
