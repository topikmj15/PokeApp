//
//  EggGroup.swift
//  PokeApp
//
//  Created by GMV on 23/08/21.
//

import Foundation

class EggGroup: Decodable {
  var name: String
  
  enum CodingKeys: String, CodingKey {
    case name
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
  }
}
