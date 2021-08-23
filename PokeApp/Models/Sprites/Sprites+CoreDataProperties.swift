//
//  Sprites+CoreDataProperties.swift
//  PokeApp
//
//  Created by Topik Mujianto on 21/08/21.
//
//

import Foundation
import CoreData


extension Sprites {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Sprites> {
    return NSFetchRequest<Sprites>(entityName: "Sprites")
  }
  
  @NSManaged public var frontDefault: URL?
  @NSManaged public var normal: URL?
  @NSManaged public var shiny: URL?
  
}

extension Sprites : Identifiable {
  
}
