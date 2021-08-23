//
//  PokemonDetail.swift
//  PokeApp
//
//  Created by Topik Mujianto on 22/08/21.
//


class PokemonDetail: Decodable {
  var sprites: Sprites?
  var types: [Type]
  var stats: [Stat]
  var abilities: [Ability]
  
  enum CodingKeys: String, CodingKey {
    case sprites, types, stats, abilities
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.sprites = try container.decodeIfPresent(Sprites.self, forKey: .sprites)
    self.types = try container.decodeIfPresent([Type].self, forKey: .types) ?? []
    self.stats = try container.decodeIfPresent([Stat].self, forKey: .stats) ?? []
    self.abilities = try container.decodeIfPresent([Ability].self, forKey: .abilities) ?? []
  }
}
