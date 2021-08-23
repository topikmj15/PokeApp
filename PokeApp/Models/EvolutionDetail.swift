//
//  EvolutionDetail.swift
//  PokeApp
//
//  Created by GMV on 23/08/21.
//

import Foundation

class EvolutionDetail: Decodable {
  let minLevel: Int?
  let turnUpsideDown: Bool?
  
  enum CodingKeys: String, CodingKey {
    case minLevel = "min_level"
    case turnUpsideDown = "turn_upside_down"
  }
}
