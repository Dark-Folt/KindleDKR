//
//  BookCell.swift
//  KindleDKR
//
//  Created by Kamil Ben on 08/01/2019.
//  Copyright © 2019 Dark Folt. All rights reserved.
//

import UIKit


/* Elle va me permtre de customiser mes cellules
 car je ne peux pas le faire avec le storyBoard parce que je l'ai supprimé
*/

class BookCell: UITableViewCell {
    
     let defaults = UserDefaults.standard
    //Je vais observer la propriété book
    var book : Book? {
        didSet{
            coverImage.image = book?.coverImage
            titleLabel.text = book?.title
            authorLabel.text = book?.author
        }
    }
    
    
    //-MARK:  SubView de la cellule
    
   fileprivate let coverImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "steve_jobs")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
   fileprivate let titleLabel: UILabel = {
         let label = UILabel()
        label.text = "Titre du livre"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   fileprivate let authorLabel: UILabel = {
        let label = UILabel()
        label.text = "Auteur du livre"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //-MARK: AutoLayout and SubView
    
    private func setupSubViews(){
        addSubview(coverImage)
        addSubview(titleLabel)
        addSubview(authorLabel)
        
        
        /*Maintenant je fais mettre en place les contraint
         de mes subview pour qu'elles soient responsives: je vais utiliser un tableau NSlayoutConstraint au lieux de faire un à un*/
        
        NSLayoutConstraint.activate([
            //CoverImage constraints
            coverImage.widthAnchor.constraint(equalToConstant: 50),
            coverImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            coverImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            coverImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            
            //TitleLabel constraint
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10),
            
            //AuthorLabel constraint
            authorLabel.heightAnchor.constraint(equalToConstant: 25),
            authorLabel.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4)
            
            ])
        
    }
    
}
