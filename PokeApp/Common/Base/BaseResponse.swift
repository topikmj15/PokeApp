//
//  BaseModel.swift
//  PokeApp
//
//  Created by Topik Mujianto on 20/08/21.
//

import Foundation

class BaseResponse<T>: Decodable where T: Decodable {
  var results: T?
  var chain: T?
  
  enum CodingKeys: String, CodingKey {
    case results
    case chain
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    if container.contains(.results) {
      results = try container.decodeIfPresent(T.self, forKey: .results)
    }
    
    if container.contains(.chain) {
      chain = try container.decodeIfPresent(T.self, forKey: .chain)
    }
  }
}
