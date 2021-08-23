//
//  Chain.swift
//  PokeApp
//
//  Created by GMV on 23/08/21.
//

import Foundation

struct Chain: Decodable {
  var evolutionDetails: [EvolutionDetail] = [EvolutionDetail]()
  var evolvesTo: [Chain] = [Chain]()
  var species: NameURL?
  
  var fromName: String?
  var toName: String?
  var level: Int?
  var fromImageURL: String?
  var toImageURL: String?
  
  enum CodingKeys: String, CodingKey {
    case evolutionDetails = "evolution_details"
    case evolvesTo = "evolves_to"
    case species
  }
  
  init(fromName: String, toName: String, level: Int, fromImageURL: String, toImageURL: String) {
    self.fromName = fromName
    self.toName = toName
    self.level = level
    self.fromImageURL = fromImageURL
    self.toImageURL = toImageURL
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.evolutionDetails = try container.decodeIfPresent([EvolutionDetail].self, forKey: .evolutionDetails) ?? []
    self.evolvesTo = try container.decodeIfPresent([Chain].self, forKey: .evolvesTo) ?? []
    self.species = try container.decodeIfPresent(NameURL.self, forKey: .species)
  }
}
