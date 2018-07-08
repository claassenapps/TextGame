//
//  DialogueCell.swift
//  TextRPG
//
//  Created by Michelle Claassen on 7/7/18.
//  Copyright © 2018 ClaassenApps. All rights reserved.
//

import Foundation
import UIKit

class DialogueCell: UITableViewCell {
    
    let theImageView: UIImageView = UIImageView()
    let theTextLabel: UILabel = UILabel()
    let characterNameLabel: UILabel = UILabel()
    
    init(text: String, reuseIdenfifier: String) {
        super.init(style: .default, reuseIdentifier: reuseIdenfifier)
        
        self.theImageView.image = UIImage(named:"image1")
        self.theImageView.layer.borderWidth = 1
        self.theImageView.layer.cornerRadius = 5
        self.theImageView.clipsToBounds = true
        
        self.addSubview(self.theImageView)
//        _ = self.theImageView.mas_makeConstraints { (make) in
//            _ = make?.left.equalTo()(self.mas_left)?.offset()(10)
//            _ = make?.top.equalTo()(self.mas_top)?.offset()(10)
//            _ = make?.width.and().height().equalTo()(55)
//        }
        
        self.theTextLabel.attributedText = NSAttributedString(string: text, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15)])
        self.theTextLabel.numberOfLines = 0
        self.addSubview(self.theTextLabel)
//        _ = self.theTextLabel.mas_makeConstraints { (make) in
//            _ = make?.left.equalTo()(self.theImageView.mas_right)?.offset()(10)
//            _ = make?.top.equalTo()(self.theImageView.mas_top)
//            _ = make?.right.equalTo()(self.mas_right)?.offset()(-10)
//        }
        
        self.characterNameLabel.attributedText = NSAttributedString(string: "Kevin", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12)])
        self.characterNameLabel.numberOfLines = 1
        self.characterNameLabel.textAlignment = .center
        self.characterNameLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(self.characterNameLabel)
//        _ = self.characterNameLabel.mas_makeConstraints { (make) in
//            _ = make?.left.equalTo()(self.mas_left)?.offset()(10)
//            _ = make?.top.equalTo()(self.theImageView.mas_bottom)?.offset()(3)
//            _ = make?.right.equalTo()(self.theTextLabel.mas_left)?.offset()(-10)
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
