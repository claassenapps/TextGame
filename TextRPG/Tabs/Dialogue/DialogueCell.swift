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
    
    //init(name: Character, text: String, reuseIdenfifier: String) {
    init(dialogue: Dialogue, reuseIdentifier: String) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        self.theImageView.image = self.getImageForName(name: dialogue.name)
        self.theImageView.layer.borderWidth = 1
        self.theImageView.layer.cornerRadius = 5
        self.theImageView.layer.borderColor = self.imageBorderColor(name: dialogue.name)
        self.theImageView.clipsToBounds = true
        
        self.addSubview(self.theImageView)
        
        self.theTextLabel.attributedText = NSAttributedString(string: dialogue.text, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15)])
        self.theTextLabel.numberOfLines = 0
        self.addSubview(self.theTextLabel)
        
        self.characterNameLabel.attributedText = NSAttributedString(string: dialogue.name.rawValue, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12)])
        self.characterNameLabel.numberOfLines = 1
        self.characterNameLabel.textAlignment = .center
        self.characterNameLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(self.characterNameLabel)
    }
    
    func imageBorderColor(name: Character) -> CGColor {
        //do not add default so this stays up-to-date when new characters are added
        switch name {
        case .Kevin: return UIColor.blue.cgColor
        case .David: return UIColor.green.cgColor
        }
    }
    
    //TODO: add in mood condition
    func getImageForName(name: Character) -> UIImage {
        switch name {
        case .Kevin: return UIImage(named: "image1") ?? UIImage()
        case .David: return UIImage(named: "image2") ?? UIImage()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
