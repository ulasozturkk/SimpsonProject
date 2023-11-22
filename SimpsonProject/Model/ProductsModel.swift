//
//  ProductsModel.swift
//  SimpsonProject
//
//  Created by macbook pro on 23.11.2023.
//

import Foundation

struct ProductsModel: Codable {
    let name, category, description, details: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case name, category, description
        case details = "Details"
        case id
    }
}


