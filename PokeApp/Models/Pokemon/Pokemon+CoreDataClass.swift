//
//  Pokemon+CoreDataClass.swift
//  PokeApp
//
//  Created by Topik Mujianto on 21/08/21.
//
//

import Foundation
import CoreData

@objc(Pokemon)
public class Pokemon: NSManagedObject, Decodable {
  var url: String?
  var types: [Type]?
  var abilities: [Ability]?
  var stats: [Stat]?
  
  enum CodingKeys: String, CodingKey {
    case name
    case url
    case types
  }
  
  convenience init() {
    let context = CoreDataStore.shared.persistentContainer.viewContext
    self.init(context: context)
  }
  
  convenience init(id: Int64, name: String?, sprites: Sprites?, types: [Type], abilities: [Ability], stats: [Stat]) {
    self.init()
    self.id = id
    self.name = name
    self.sprites = sprites
    self.types = types
    self.abilities = abilities
    self.stats = stats
  }
  
  required public convenience init(from decoder: Decoder) throws {
    self.init()
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
    let urlString = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
    self.url = String(urlString.dropLast())
    self.types = try container.decodeIfPresent([Type].self, forKey: .types)
  }
}
