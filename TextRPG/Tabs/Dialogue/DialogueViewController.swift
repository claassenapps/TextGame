//
//  DialogueViewController.swift
//  TextRPG
//
//  Created by Michelle Claassen on 7/7/18.
//  Copyright © 2018 ClaassenApps. All rights reserved.
//

import Foundation
import UIKit
import Masonry

class DialogueViewController: UIViewController {
    
    var tableView: UITableViewController
    
    init() {
        self.tableView = DialogueTableViewController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.title = "Dialogue"
        self.view.addSubview(self.tableView.view)
        
        self.tableView.view.mas_makeConstraints { (make) in
            make?.edges.equalTo()(self.view)
        }
    }
}
