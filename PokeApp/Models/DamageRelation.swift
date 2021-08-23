//
//  DamageRelation.swift
//  PokeApp
//
//  Created by GMV on 23/08/21.
//

import UIKit

class DamageRelation: Decodable {
  var doubleDamageFrom: [NameURL]
  
  enum CodingKeys: String, CodingKey {
    case doubleDamageFrom = "double_damage_from"
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.doubleDamageFrom = try container.decodeIfPresent([NameURL].self, forKey: .doubleDamageFrom) ?? []
  }
}
