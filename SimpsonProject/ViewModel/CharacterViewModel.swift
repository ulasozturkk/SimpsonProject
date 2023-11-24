//
//  CharacterViewModel.swift
//  SimpsonProject
//
//  Created by macbook pro on 24.11.2023.
//

import Foundation

protocol CharacterSelectionDelegate{
    func didSelectCharacter(chosenCharacters : [CharacterModel])
}

class CharacterViewModel{
    
    var characters : [CharacterModel] = []
    var delegate : CharacterSelectionDelegate?
    
    func getAllCharacters(){
        CharacterService.shared.getCharacters { result in
            switch result{
            case .success(let models):
         
                self.characters = models
                self.delegate?.didSelectCharacter(chosenCharacters: models)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
}
