//
//  NameURL.swift
//  PokeApp
//
//  Created by GMV on 23/08/21.
//

import Foundation

class NameURL: Decodable {
  let name: String
  let url: String
  
  enum CodingKeys: String, CodingKey {
    case name, url
  }
  
  
}
