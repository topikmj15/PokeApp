//
//  Type.swift
//  PokeApp
//
//  Created by Topik Mujianto on 22/08/21.
//

import Foundation

class Type: Decodable {
  var damageRelations: DamageRelation?
  var type: NameURL?
  
  enum CodingKeys: String, CodingKey {
    case type
    case damageRelations = "damage_relations"
  }
  
  init() {}
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
  
    self.type = try container.decodeIfPresent(NameURL.self, forKey: .type)
    self.damageRelations = try container.decodeIfPresent(DamageRelation.self, forKey: .damageRelations)
  }
}
