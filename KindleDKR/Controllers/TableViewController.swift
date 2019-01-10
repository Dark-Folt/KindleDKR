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
    var isDarkMode = false
    
    let defaults = UserDefaults.standard
   private let cellID = "sqfskf"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainTableView()
        seupNavigationBarButtons()
        setupBooks()


    }
    
    //Quand la vue s'affiche
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkForStylePreference()
        
    }
    
    
    //Je part chercher le theme
    func checkForStylePreference(){
        let prefersDarkMod = defaults.bool(forKey: Keys.prefersDarkMode)

        if prefersDarkMod { // si prefersDarkMod == true
            isDarkMode = true
            updateStyle()
        }else{
            isDarkMode = false
            updateStyle()
        }
        
    }
    
    func updateStyle(){
        UIView.animate(withDuration: 0.4) {
            self.tableView.backgroundColor = Theme.currentTheme.backgroundColor
            
        }
        tableView.reloadData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    private func setupMainTableView(){
        tableView.register(BookCell.self, forCellReuseIdentifier: cellID)
        
        tableView.tableFooterView = UIView() //Pour rien afficher en bas des cellules
        
        navigationItem.title = "Kindle"
        navigationController?.navigationBar.tintColor = self.isDarkMode ? UIColor.yellow : UIColor.black
    }
    
    private func seupNavigationBarButtons(){
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings")?.withRenderingMode(.automatic), style: .plain, target: self, action: #selector(handleSettingsPressed))
    }
    
    @objc private func handleSettingsPressed(){
        let settingsController = SettingsViewController()
        navigationController?.pushViewController(settingsController, animated: true)
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! BookCell
        
        let currentBook = books?[indexPath.row]
    
        //Constant de la font couleur
        let fontColor = Theme.currentTheme.fontColor
        cell.titleLabel.text = currentBook?.title
        cell.titleLabel.textColor = fontColor
        cell.authorLabel.text = currentBook?.author
        cell.authorLabel.textColor = fontColor
        cell.coverImage.image = currentBook?.coverImage

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
        
        let selectedBook = self.books?[indexPath.row]//Juste une reference pour la passé dans pager
        
        let layout = UICollectionViewFlowLayout()
        
        let bookPagerController = BookPagerController(collectionViewLayout: layout)
        bookPagerController.book = selectedBook
        
        navigationController?.pushViewController(bookPagerController, animated: true)
        
    }
    
    
    private func setupBooks(){
        let page1 = Page(text: """
 Tout a commencé au début de l'été 2004, par un appel téléphonique de
 Steve Jobs. Il m'avait toujours, de loin en loin, témoigné une certaine amitié, avec des rapprochements soudains quand il lançait un nouveau produit et qu'il voulait la couverture médiatique du Time ou de CNN - puisqu'à l'époque je travaillais pour ces deux sociétés. Mais en 2004 ce n'était
 plus le cas et cela faisait bien longtemps que je n'avais pas eu de nouvelles de Steve Jobs. On a évoqué un peu l'Institut Aspen que j'avais rejoint dernièrement, et je lui ai proposé de venir donner une conférence
 lors de notre université d'été dans le Colorado. Il m'a répondu qu'il serait
 ravi de venir, mais qu'il ne monterait pas sur scène. Il voulait, en réalité,
 se promener avec moi et me parler.
 """, number: 1)
        let page2 = Page(text: """
 Cela m'a paru quelque peu curieux. J'ignorais à l'époque que c'était son
 modus operandi quand il avait une affaire délicate à régler. J'appris donc, au
 cours de cette marche, qu'il souhaitait que j'écrive une biographie sur lui.
 J'avais récemment publié celle de Benjamin Franklin et travaillais sur celle
 d'Albert Einstein ; je me suis demandé, avec amusement, si Steve Jobs
 avait la fatuité de se placer dans la suite logique des deux précédents. Jugeant qu'il était au milieu de sa carrière et que la vie lui réservait encore
 bien des rebondissements, j'ai décliné l'offre. Dans dix ou vingt ans peutêtre, lui ai-je répliqué, quand vous aurez pris votre retraite...
 """, number: 2)
        
        let page3 = Page(text: """
 J'avais rencontré Steve Jobs la première fois en 1984, lorsqu'il était venu
 au siège de Time-Life à Manhattan pour déjeuner avec l'équipe de rédaction et faire l'article pour son nouveau Macintosh. Il était déjà vif à l'époque, et avait fustigé un correspondant du Time qui avait eu le malheur
 d'écrire sur lui un article un peu trop « indiscret ». Mais en conversant
 avec lui après la réunion, j'ai été, comme tant d'autres personnes avant
 """, number: 3)
        
        let pages = [page1,page2,page3]

        let book1 = Book(title: "Steve Jobs", author: "Walter Isacson", coverImage: UIImage(named: "steve_jobs")!, pages: pages)
        let book2 = Book(title: "Bils Gates", author: "Je ne sais pas", coverImage: UIImage(named: "bill_gates")!, pages: [
            Page(text: """
Entrepreneur Bill Gates, born on October 28, 1955, in Seattle, Washington, began to show an interest in computer
programming at the age of 13. Through technological innovation, keen business strategy, and aggressive competitive tactics, he
and his partner Paul Allen built the world's largest software business, Microsoft. In the process, Bill Gates became one of the
richest men in the world.
EARLY LIFE
Born William Henry Gates III, on October 28, 1955, in Seattle, Washington. Gates began to show an interest in computer
programming at the age of 13 at the Lakeside School. He pursued his passion through college. Striking out on his own with his
friend and business partner Paul Allen, Gates found himself at the right place at the right time. Through technological
innovation, keen business strategy, and aggressive competitive tactics he built the world's largest software business, Microsoft.
In the process he became one of the richest men in the world.
""",
                 number: 1),
            Page(text: """
Bill Gates grew up in an upper middle-class family with two sisters: Kristianne, who is older, and Libby, who is younger. Their
father, William H. Gates, Sr., was a promising, if somewhat shy, law student when he met his future wife, Mary Maxwell. She
was an athletic, outgoing student at the University of Washington, actively involved in student affairs and leadership. The Gates
family atmosphere was warm and close, and all three children were encouraged to be competitive and strive for excellence. Bill
showed early signs of competitiveness when he coordinated family athletic games at their summer house on Puget Sound. He
also relished in playing board games (Risk was his favorite) and excelled in Monopoly.
Bill had a very close relationship with his mother, Mary, who after a brief career as a teacher devoted her time to helping raise
the children and working on civic affairs and with charities. She also served on several corporate boards, among them First
Interstate Bank in Seattle (founded by her grandfather), the United Way, and International Business Machines (IBM). She
would often take Bill along on her volunteer work in schools and community organizations.
""", number: 2),
            Page(text: """
Bill was a voracious reader as a child, spending many hours pouring over reference books such as the encyclopedia. Around the
age of 11 or 12, Bill's parents began to have concerns about his behavior. He was doing well in school, but he seemed bored
and withdrawn at times. His parents worried he might become a loner. Though they were strong believers in public education,
when Bill turned 13 they enrolled him in Seattle's Lakeside School, an exclusive preparatory school. He blossomed in nearly all his subjects, excelling in math and science, but
also doing very well in drama and English.
While at Lakeside School, a Seattle computer company offered to provide computer time for the students. The Mother's Club used proceeds from the school's rummage sale to
purchase a teletype terminal for students to use. Bill Gates became entranced with what a computer could do and spent much of his free time working on the terminal. He wrote
a tic-tac-toe program in BASIC computer language that allowed users to play against the computer.
""", number: 3),
            Page(text: """
It was at Lakeside School where Bill met Paul Allen, who was two years his senior. The two became fast friends, bonding on their common enthusiasm over computers, even
though they were very different. Allen was more reserved and shy. Bill was feisty and at times combative. They both spent much of their free time together working on
programs. Occasionally, they disagreed and would clash over who was right or who should run the computer lab. On one occasion, their argument escalated to the point where
Allen banned Gates from the computer lab. On another occasion, Gates and Allen had their school computer privileges revoked for taking advantage of software glitches to
obtain free computer time from the company that provided the computers. After their probation, they were allowed back in the
computer lab when they offered to debug the program. During this time, Gates developed a payroll program for the computer company the boys hacked into, and a scheduling
program for the school.
""", number: 4)
            
            ])

        self.books = [book1,book2]
        
    }


}

