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
    
    let cellID = "sqfskf"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainTableView()
        setupBooks()

    }
    
    private func setupMainTableView(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.tableFooterView = UIView() //Pour rien afficher en bas des cellules
        
        navigationItem.title = "Kindle"
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.backgroundColor = UIColor.yellow
        let currentBook = books?[indexPath.row]
        cell.textLabel?.text = currentBook?.title
        cell.imageView?.image = currentBook?.coverImage
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = books?.count {
            return count
        }
        return 0
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

