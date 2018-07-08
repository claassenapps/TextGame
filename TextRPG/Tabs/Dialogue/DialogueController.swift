//
//  DialogueController.swift
//  TextRPG
//
//  Created by Michelle Claassen on 7/8/18.
//  Copyright © 2018 ClaassenApps. All rights reserved.
//

import Foundation

final class DialogueController: NSObject {
    
    static let sharedInstance:DialogueController = {
        let instance = DialogueController()
        return instance
    }()
    
    var currentID: Int = 0
    var dialogueDictionary: NSDictionary?
    
    let fileName: String = "DialogueList"
    static let currentIDKey: String = "currentID"
    
    struct dictionaryKeys {
        static let name = "name"
        static let text = "text"
        static let mood = "mood"
    }
    
    override init() {
        //load the dialogue currentID
        self.currentID = UserDefaults.standard.integer(forKey: DialogueController.currentIDKey)
        
        //load the dialogue contents
        if let path = Bundle.main.path(forResource: fileName, ofType: "plist"), let theDict = NSDictionary(contentsOfFile: path) {
            self.dialogueDictionary = theDict
        }
        super.init()
    }
    
    //This is the list of all possible dialogues.
    func getDialogueForID(_ ID: Int) -> Dialogue? {
        guard let dialogueInfo = self.dialogueDictionary?.value(forKey: "\(ID)") as? NSDictionary else {
            return nil
        }
        if let name = dialogueInfo.value(forKey: dictionaryKeys.name) as? String, let text = dialogueInfo.value(forKey: dictionaryKeys.text) as? String, let theNameAsCharacter = self.getCharacterFromName(name: name) {
            //let mood = dialogueInfo.value(forKey: dictionaryKeys.mood) ?? 0 //TODO: possibility for the future
            return Dialogue(id: self.currentID, name: theNameAsCharacter, text: text)
        }
        return nil
    }
    
    func getCharacterFromName(name: String) -> Character? {
        if name == Character.Kevin.rawValue {
            return Character.Kevin
        } else if name == Character.David.rawValue {
            return Character.David
        }
        
        return nil
    }
    
    func getCurrentDialogue() -> Dialogue? {
        return self.getDialogueForID(self.currentID)
    }
    
    func getNextDialoguefromID(_ ID: Int) -> Dialogue? {
        //currently only returning +1 from self.currentID. will eventually use self.getNextID.
        return self.getDialogueForID(self.currentID + 1)
    }
    
    func resetCurrentIDTo(_ ID: Int, save: Bool) {
        self.currentID = ID
        
        if save == true {
            UserDefaults.standard.set(ID, forKey: DialogueController.currentIDKey)
        }
    }
    
    //TODO: once the in-game factors are decided on, figure out algorithm for returning the next ID
//    func getNextID(PUT IN FACTORS HERE) -> Int {
//
//    }
}
