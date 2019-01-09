//
//  PageCell.swift
//  KindleDKR
//
//  Created by Kamil Ben on 09/01/2019.
//  Copyright © 2019 Dark Folt. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    
    let textLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.contentMode = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviwes()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviwes(){
        backgroundColor = .white
        addSubview(textLabel)
        
        textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 64).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
    }
}
