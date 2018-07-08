//
//  DialogueTableViewController.swift
//  TextRPG
//
//  Created by Michelle Claassen on 7/7/18.
//  Copyright © 2018 ClaassenApps. All rights reserved.
//

import Foundation
import UIKit

class DialogueTableViewController: UITableViewController {
    
    var conversations: [String] = ["Hello my name is Kevin Claassen. I'm thinking of making a game if I can make this work out. It's going ok, but it's been difficult to really find out how to customize things.", "Goodbye", "Test1", "Test2"]
    let constants: Constants

    struct Constants {
        let dialogueFontSize: CGFloat = 15
        let nameFontSize: CGFloat = 11
        let cellIdentifier: String = "dialogueCell"
        let imageOffset: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let textOffset: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let characterNameOffset: UIEdgeInsets = UIEdgeInsets(top: 3, left: 5, bottom: 0, right: 5)
        let imageSize: CGSize = CGSize(width: 55, height: 55)
    }
    
    init() {
        self.constants = Constants()
        super.init(style: .grouped)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversations.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //find the height of the text given the width of the space availble in the tableview
        //if that height is greater than the image size plus spacing, return it
        if self.conversations.indices.count >= indexPath.row {
            let widthOffset = self.constants.imageSize.width + self.constants.imageOffset.left + self.constants.textOffset.left + self.constants.textOffset.right
            let totalCellWidth = tableView.frame.size.width - widthOffset
            
            let string = self.conversations[indexPath.row]
            let attString = NSAttributedString(string: string, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: self.constants.dialogueFontSize)])
            
            let nameOffset: CGFloat = 10
            let attHeight = attString.height(withConstrainedWidth: totalCellWidth) + self.constants.textOffset.top + self.constants.textOffset.bottom
            let heightThreshold = self.constants.imageSize.height + self.constants.imageOffset.top + self.constants.imageOffset.bottom + nameOffset
            return (attHeight > heightThreshold) ? attHeight : heightThreshold
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.constants.cellIdentifier) ??
            DialogueCell(text: self.conversations[indexPath.row], reuseIdenfifier: self.constants.cellIdentifier)
        
        if let theCell = cell as? DialogueCell {
            _ = theCell.theImageView.mas_makeConstraints { (make) in
                _ = make?.left.equalTo()(theCell.mas_left)?.offset()(self.constants.imageOffset.left)
                _ = make?.top.equalTo()(theCell.mas_top)?.offset()(self.constants.imageOffset.top)
                _ = make?.width.and().height().equalTo()(self.constants.imageSize.width)
            }
            
            _ = theCell.theTextLabel.mas_makeConstraints { (make) in
                _ = make?.left.equalTo()(theCell.theImageView.mas_right)?.offset()(self.constants.textOffset.left)
                _ = make?.top.equalTo()(theCell.theImageView.mas_top)
                _ = make?.right.equalTo()(theCell.mas_right)?.offset()(-self.constants.textOffset.right)
            }
            
            _ = theCell.characterNameLabel.mas_makeConstraints { (make) in
                _ = make?.left.equalTo()(theCell.mas_left)?.offset()(self.constants.characterNameOffset.left)
                _ = make?.top.equalTo()(theCell.theImageView.mas_bottom)?.offset()(self.constants.characterNameOffset.top)
                _ = make?.right.equalTo()(theCell.theTextLabel.mas_left)?.offset()(-self.constants.characterNameOffset.right)
            }
        }
        return cell
    }
}

extension NSAttributedString {
    func height(withConstrainedWidth width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        return ceil(boundingBox.height)
    }
}




