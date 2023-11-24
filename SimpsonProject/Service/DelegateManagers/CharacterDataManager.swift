//
//  CharacterDataManager.swift
//  SimpsonProject
//
//  Created by macbook pro on 24.11.2023.
//

import Foundation


class CharacterDataManager {
    var delegate : CharacterSelectionDelegate?
    
    func processCharacter(chosenCharacter : [CharacterModel]){
        let chosenCharacter = chosenCharacter
        delegate?.didSelectCharacter(chosenCharacters: chosenCharacter)
    }
}
