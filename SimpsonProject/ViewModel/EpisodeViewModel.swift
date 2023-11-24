//
//  EpisodeViewModel.swift
//  SimpsonProject
//
//  Created by macbook pro on 25.11.2023.
//

import Foundation

protocol EpisodeDelegate {
    func didSelectEpisodes(episodeModel : [EpisodeModel])
}


class EpisodeViewModel {
    
    var delegate : EpisodeDelegate?
    
    func getAllEpisodes(){
        EpisodeService.shared.getEpisodes { result in
            switch result{
            case .success(let models):
                self.delegate?.didSelectEpisodes(episodeModel: models)
            case .failure(let err):
                print(err)
            }
        }
    }
    
}
