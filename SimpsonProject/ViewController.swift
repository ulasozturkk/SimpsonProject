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
            ProductsService.shared.getProducts { result in
                switch result {
                case .success(let models):
                    print(models)
                case .failure(let err):
                    print(err)
                }
            }
        }
        
        
    }
    

}

