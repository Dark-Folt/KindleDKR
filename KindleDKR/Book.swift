//
//  Book.swift
//  KindleDKR
//
//  Created by Kamil Ben on 08/01/2019.
//  Copyright © 2019 Dark Folt. All rights reserved.
//

import UIKit


class Book {
    let title: String
    let author: String
    let coverImage: UIImage
    let pages: [Page]
    
    init(title: String, author: String, coverImage: UIImage, pages: [Page]) {
        self.title = title
        self.author = author
        self.coverImage = coverImage
        self.pages = pages
    }
}
