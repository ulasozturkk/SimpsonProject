//
//  ProductsService.swift
//  SimpsonProject
//
//  Created by macbook pro on 23.11.2023.
//

import Foundation


protocol ProductsServiceDelegate {
    func getProducts(completion : @escaping (Result<[ProductsModel],NetworkError>) -> ())
}

class ProductsService : ProductsServiceDelegate {
    
    static let shared = ProductsService()
    
    func getProducts(completion: @escaping (Result<[ProductsModel], NetworkError>) -> ()) {
        let endpoint = EndPoint.getProducts
        
        NetworkManager.shared.request(endpoint, completion: completion)
    }
}
