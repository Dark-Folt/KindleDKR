//
//  SettingsViewController.swift
//  KindleDKR
//
//  Created by Kamil Ben on 09/01/2019.
//  Copyright © 2019 Dark Folt. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let styleSegmentedControl : UISegmentedControl = {
        
        let items = ["Dark","Light"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = Theme.currentTheme.segmentedTintColor
        segmentedControl.addTarget(self, action: #selector(handleSegmented), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        return segmentedControl
    }()
    
    @objc func handleSegmented(_ sender: UISegmentedControl){
        
        isDarkMode = sender.selectedSegmentIndex == 1
        
        if sender.selectedSegmentIndex == 1 {
            Theme.currentTheme = DarkTheme()
            styleSegmentedControl.tintColor = Theme.currentTheme.segmentedTintColor
        }else{
            Theme.currentTheme = LightTheme()
            styleSegmentedControl.tintColor = UIColor.white
        }
        updateStyle()
        saveStylePreference()
    }
    
    
    //MARK: Setup User Default
    var isDarkMode = false
    let defaults = UserDefaults.standard
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupSubViews()
        checkForStylePreference()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = Theme.currentTheme.backgroundColor
    }
    
    func updateStyle(){
        UIView.animate(withDuration: 0.4) {
            self.view.backgroundColor = Theme.currentTheme.backgroundColor

        }
    }

    //TODO: - Setup my Navigation bar
    private func setupNavBar(){
        navigationItem.title = "Settings"
    }
    
    //TODO:- Adding my subViews
    private func setupSubViews(){
        view.addSubview(styleSegmentedControl)
        styleSegmentedControl.widthAnchor.constraint(equalToConstant: 350).isActive = true
        styleSegmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        styleSegmentedControl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        styleSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    
    //MARK- Interacting with UserDefaults
    func saveStylePreference(){
        defaults.set(isDarkMode, forKey: Keys.prefersDarkMode)
    }

    func checkForStylePreference(){
        let prefersDarkMod = defaults.bool(forKey: Keys.prefersDarkMode)

        print(prefersDarkMod)

        if prefersDarkMod {
            isDarkMode = true
            updateStyle()
            styleSegmentedControl.selectedSegmentIndex = 1
        }
    }
}
