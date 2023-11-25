//
//  ProductViewModel.swift
//  SimpsonProject
//
//  Created by macbook pro on 25.11.2023.
//

import Foundation

protocol ProductDelegate {
    func didSelectProduct(model : [ProductsModel])
}

class ProductViewModel {
    
    var delegate : ProductDelegate?
    
    func getAllProducts() {
        ProductsService.shared.getProducts { result in
            switch result {
            case .success(let models):
                self.delegate?.didSelectProduct(model: models)
            case .failure(let err):
                print(err)
            }
        }
    }
}
