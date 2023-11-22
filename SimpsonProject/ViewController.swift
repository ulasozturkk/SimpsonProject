//
//  ViewController.swift
//  SimpsonProject
//
//  Created by macbook pro on 22.11.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        
        getEpisodes()
        
        
    }
    
    func getEpisodes(){
        
        DispatchQueue.main.async {
            EpisodeService.shared.getEpisodes { result in
                switch result{
                case .success(let episodes):
                    print(episodes)
                case .failure(let err):
                    print(err)
                }
            }
        }
        
        
    }
    

}

