//
//  Sprites+CoreDataClass.swift
//  PokeApp
//
//  Created by Topik Mujianto on 21/08/21.
//
//

import Foundation
import CoreData

@objc(Sprites)
public class Sprites: NSManagedObject, Decodable {
  enum ParentKeys: String, CodingKey {
    case other
    case normal = "front_default"
    case shiny = "front_shiny"
  }
  
  enum OtherKeys: String, CodingKey {
    case officialAtwork = "official-artwork"
  }
  
  enum OfficialAtworKeys: String, CodingKey {
    case frontDefault = "front_default"
  }
  
  convenience init() {
    let context = CoreDataStore.shared.persistentContainer.viewContext
    self.init(context: context)
  }
  
  convenience init(frontDefault: URL?, normal: URL?, shiny: URL?) {
    self.init()
    self.frontDefault = frontDefault
    self.normal = normal
    self.shiny = shiny
  }
  
  required public convenience init(from decoder: Decoder) throws {
    self.init()
    let container = try decoder.container(keyedBy: ParentKeys.self)
    let otherContainer = try container.nestedContainer(keyedBy: OtherKeys.self, forKey: .other)
    let officialAtworkContainer = try otherContainer.nestedContainer(keyedBy: OfficialAtworKeys.self, forKey: .officialAtwork)
    
    self.normal = URL(string: try container.decodeIfPresent(String.self, forKey: .normal) ?? "")
    self.shiny = URL(string: try container.decodeIfPresent(String.self, forKey: .shiny) ?? "")
    
    let frontDefaultString = try officialAtworkContainer.decodeIfPresent(String.self, forKey: .frontDefault) ?? ""
    self.frontDefault = URL(string: frontDefaultString) ?? URL(string: "https://p3sweetener.com.my/2016/wp-content/uploads/ef3-placeholder-image.jpg")!
  }
}
