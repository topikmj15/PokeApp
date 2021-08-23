//
//  Ability.swift
//  PokeApp
//
//  Created by GMV on 23/08/21.
//

import Foundation

class Ability: Decodable {
  var name: String
  
  enum ParentKeys: String, CodingKey {
    case ability
  }
  
  enum ChildKeys: String, CodingKey {
    case name
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ParentKeys.self)
    let childContainer = try container.nestedContainer(keyedBy: ChildKeys.self, forKey: .ability)
    self.name = try childContainer.decodeIfPresent(String.self, forKey: .name) ?? ""
  }
}
