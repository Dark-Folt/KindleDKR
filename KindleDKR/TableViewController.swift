//
//  ViewController.swift
//  KindleDKR
//
//  Created by Kamil Ben on 08/01/2019.
//  Copyright © 2019 Dark Folt. All rights reserved.
//

import UIKit


class TableViewController: UITableViewController {
    
    var books: [Book]?
    
   private let cellID = "sqfskf"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainTableView()
        setupBooks()

    }
    
    private func setupMainTableView(){
        tableView.register(BookCell.self, forCellReuseIdentifier: cellID)
        tableView.tableFooterView = UIView() //Pour rien afficher en bas des cellules
        
        navigationItem.title = "Kindle"
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! BookCell
        
        let currentBook = books?[indexPath.row]
        
        cell.book = currentBook //Waw le pouvoir de l'encapsulation
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = books?.count {
            return count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedBook = self.books?[indexPath.row]
        
        let layout = UICollectionViewFlowLayout()
        
        let bookPagerController = BookPagerController(collectionViewLayout: layout)
        bookPagerController.book = selectedBook
        
        navigationController?.pushViewController(bookPagerController, animated: true)
        
    }
    
    
    private func setupBooks(){
        let page1 = Page(text: "Text for the frist page", number: 1)
        let page2 = Page(text: "Text for the second page", number: 2)
        
        let pages = [page1,page2]
        
        
        let book1 = Book(title: "Steve Jobs", author: "Walter Isacson", coverImage: UIImage(named: "steve_jobs")!, pages: pages)
        let book2 = Book(title: "Bils Gates", author: "Je ne sais pas", coverImage: UIImage(named: "bill_gates")!, pages: pages)
        
        
        self.books = [book1,book2]
        
    }


}

