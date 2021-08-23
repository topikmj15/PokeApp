//
//  Pokemon+CoreDataProperties.swift
//  PokeApp
//
//  Created by Topik Mujianto on 21/08/21.
//
//

import Foundation
import CoreData


extension Pokemon {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Pokemon> {
    return NSFetchRequest<Pokemon>(entityName: "Pokemon")
  }
  
  @NSManaged public var type: String?
  @NSManaged public var name: String?
  @NSManaged public var id: Int64
  @NSManaged public var sprites: Sprites?
  
}

extension Pokemon : Identifiable {
  
}
