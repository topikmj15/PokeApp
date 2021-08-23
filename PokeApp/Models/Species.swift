//
//  Species.swift
//  PokeApp
//
//  Created by GMV on 23/08/21.
//

import Foundation
import UIKit

class Species: Decodable {
  var eggGroups: [EggGroup]
  var flavorText: String
  var hatchStep: Int64
  var hatchCycle: Int64
  var female: CGFloat
  var male: CGFloat
  var habitatName: String
  var generationName: String
  var captureRate: CGFloat
  var name: String
  
  enum ParentKeys: String, CodingKey {
    case eggGroups = "egg_groups"
    case hatchCounter = "hatch_counter"
    case genderRate = "gender_rate"
    case captureRate = "capture_rate"
    case flavorTextEntries = "flavor_text_entries"
    case generation
    case habitat
    case name
  }
  
  enum EggGroupKeys: String, CodingKey {
    case name
  }
  
  enum HabitatKeys: String, CodingKey {
    case name
  }
  
  enum GenerationKeys: String, CodingKey {
    case name
  }
  
  enum ChildKeys: String, CodingKey {
    case name
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ParentKeys.self)
    let habitatContainer = try container.nestedContainer(keyedBy: HabitatKeys.self, forKey: .habitat)
    let generationContainer = try container.nestedContainer(keyedBy: GenerationKeys.self, forKey: .generation)
    
    self.eggGroups = try container.decodeIfPresent([EggGroup].self, forKey: .eggGroups) ?? []
    let hatchCounterRaw = try container.decodeIfPresent(Int64.self, forKey: .hatchCounter) ?? 0
    self.hatchStep = hatchCounterRaw * 220 + 1
    self.hatchCycle = hatchCounterRaw
    
    let genderRateRaw = try container.decodeIfPresent(Int64.self, forKey: .genderRate) ?? 0
    self.female = CGFloat(genderRateRaw) / 8.0
    self.male = CGFloat(8 - genderRateRaw) / 8.0
    
    let captureRateRaw = try container.decodeIfPresent(Double.self, forKey: .captureRate) ?? 0
    self.captureRate = ceil(CGFloat(captureRateRaw) / 255.0 * 100)
    self.habitatName = try habitatContainer.decodeIfPresent(String.self, forKey: .name) ?? ""
    self.generationName = (try generationContainer.decodeIfPresent(String.self, forKey: .name) ?? "").replacingOccurrences(of: "-", with: " ")
    
    let flavorTextEntriesRaw = try container.decodeIfPresent([FlavorText].self, forKey: .flavorTextEntries)
    self.flavorText = flavorTextEntriesRaw?.filter { $0.versionName == "ruby" }.first?.flavorText ?? ""
    
    self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
  }
}
