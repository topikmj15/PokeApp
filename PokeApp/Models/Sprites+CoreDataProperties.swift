//
//  Sprites+CoreDataProperties.swift
//  PokeApp
//
//  Created by GMV on 21/08/21.
//
//

import Foundation
import CoreData


extension Sprites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sprites> {
        return NSFetchRequest<Sprites>(entityName: "Sprites")
    }

    @NSManaged public var frontDefault: URL?

}

extension Sprites : Identifiable {

}
