//
//  BaseModel.swift
//  PokeApp
//
//  Created by GMV on 20/08/21.
//

import Foundation

class BaseModel<T: Decodable> {
    var results: T?
    var abilities: T?
    
    enum CodingKeys: String, CodingKey {
        case results
        case abilities
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if container.contains(.results) {
            results = try container.decodeIfPresent(T.self, forKey: .results)
        } else if container.contains(.abilities) {
            abilities = try container.decodeIfPresent(T.self, forKey: .abilities)
        }
    }
}
