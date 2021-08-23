//
//  Stats.swift
//  PokeApp
//
//  Created by GMV on 23/08/21.
//

import Foundation

class Stat: Decodable {
  var baseStat: Double
  var name: StatName
  
  enum ParentKeys: String, CodingKey {
    case baseStat = "base_stat"
    case stat
  }
  
  enum ChildKeys: String, CodingKey {
    case name
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ParentKeys.self)
    let childContainer = try container.nestedContainer(keyedBy: ChildKeys.self, forKey: .stat)
    
    self.baseStat = try container.decodeIfPresent(Double.self, forKey: .baseStat) ?? 0
    let nameString = try childContainer.decodeIfPresent(String.self, forKey: .name) ?? ""
    self.name = StatName(rawValue: nameString) ?? .hp
  }
}


extension Stat {
  enum StatName: String {
    case hp
    case attack
    case deffense
    case specialAttack = "special-attack"
    case specialDefense = "special-defense"
    case speed
    
    var label: String {
      switch self {
      case .hp:
        return "HP"
      case .attack:
        return "ATK"
      case .deffense:
        return "DEF"
      case .specialAttack:
        return "SATK"
      case .specialDefense:
        return "SDEF"
      case .speed:
        return "SPD"
      }
    }
  }
}
