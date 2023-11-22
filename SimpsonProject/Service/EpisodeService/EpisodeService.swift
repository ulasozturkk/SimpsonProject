//
//  EpisodeService.swift
//  SimpsonProject
//
//  Created by macbook pro on 22.11.2023.
//

import Foundation


protocol EpisodeServiceDelegate {
    func getEpisodes(completion : @escaping (Result<[EpisodeModel],NetworkError>)->())
}

class EpisodeService : EpisodeServiceDelegate {
    
    static let shared = EpisodeService()
    private init(){}
    
    func getEpisodes(completion: @escaping (Result<[EpisodeModel], NetworkError>) -> ()) {
        let endPoint = EndPoint.getEpisodes
        NetworkManager.shared.request(endPoint, completion: completion)
    }
    
    
}
