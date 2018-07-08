//
//  TabViewController.swift
//  TextRPG
//
//  Created by Michelle Claassen on 7/7/18.
//  Copyright © 2018 ClaassenApps. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        let dialogueVC = DialogueViewController()
        let dialogueBarItem = UITabBarItem(title: "Dialogue", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        dialogueVC.tabBarItem = dialogueBarItem
        
        let journalVC = JournalViewController()
        let journalBarItem = UITabBarItem(title: "Journal", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        journalVC.tabBarItem = journalBarItem
        
        let inventoryVC = InventoryViewController()
        let inventoryBarItem = UITabBarItem(title: "Inventory", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        inventoryVC.tabBarItem = inventoryBarItem
        
        self.viewControllers = [dialogueVC, journalVC, inventoryVC]
    }

}

