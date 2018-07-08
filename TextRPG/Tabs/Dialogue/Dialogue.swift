//
//  Dialogue.swift
//  TextRPG
//
//  Created by Michelle Claassen on 7/8/18.
//  Copyright © 2018 ClaassenApps. All rights reserved.
//

//This class contains all relevant information to create a section of dialogue.

import Foundation

enum Character: String {
    case Kevin = "Kevin"
    case David = "David"
}

enum Mood: Int {
    case Neutral = 0
    case Happy = 1
    case Sad = 2
    case Angry = 3
    case Surprised = 4
}

class Dialogue: NSObject {
    
    let id: Int
    let name: Character
    let text: String
    
    init(id: Int, name: Character, text: String) {
        self.id = id
        self.name = name
        self.text = text
    }
}
