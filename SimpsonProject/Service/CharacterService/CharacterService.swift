//
//  CharacterService.swift
//  SimpsonProject
//
//  Created by macbook pro on 23.11.2023.
//

import Foundation


protocol CharacterServiceDelegate {
    
    func getCharacters(completion : @escaping (Result<[CharacterModel],NetworkError>) -> ())
}

class CharacterService : CharacterServiceDelegate {
    
    static let shared = CharacterService()
    private init(){}
    
    
    func getCharacters(completion: @escaping (Result<[CharacterModel], NetworkError>) -> ()) {
        let endpoint = EndPoint.getCharacters
        NetworkManager.shared.request(endpoint, completion: completion)
    }
    
    
    
    
    
}
