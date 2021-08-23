//
//  FlavorText.swift
//  PokeApp
//
//  Created by GMV on 23/08/21.
//

import Foundation

class FlavorText: Decodable {
  var flavorText: String
  var versionName: String
  
  enum CodingKeys: String, CodingKey {
    case flavorText = "flavor_text"
    case version
  }
  
  enum VersionKeys: String, CodingKey {
    case name
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let versionContainer = try container.nestedContainer(keyedBy: VersionKeys.self, forKey: .version)
    self.flavorText = try container.decodeIfPresent(String.self, forKey: .flavorText) ?? ""
    self.versionName = try versionContainer.decodeIfPresent(String.self, forKey: .name) ?? ""
  }
}
