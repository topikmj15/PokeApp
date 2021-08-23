//
//  CoreDataStorage.swift
//  PokeApp
//
//  Created by Topik Mujianto on 20/08/21.
//

import CoreData

class CoreDataStore {
  
  private init() {}
  static let shared = CoreDataStore()
  
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "PokeApp")
    
    container.loadPersistentStores(completionHandler: { (_, error) in
      guard let error = error as NSError? else { return }
      fatalError("Unresolved error: \(error), \(error.userInfo)")
    })
    
    container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    container.viewContext.undoManager = nil
    container.viewContext.shouldDeleteInaccessibleFaults = true
    container.viewContext.automaticallyMergesChangesFromParent = true
    
    return container
  }()
  
  func savePokemon(_ data: Pokemon) {
    let context = CoreDataStore.shared.persistentContainer.viewContext
    let entity = NSEntityDescription.insertNewObject(forEntityName: "Pokemon", into: context) as! Pokemon
    entity.id = data.id
    entity.name = data.name
    entity.sprites = data.sprites
    
    var types = [String]()
    for data in data.types ?? [] {
      types.append(data.type?.name ?? "")
    }
    entity.type = types.joined(separator: ",")
    
    do {
      try CoreDataStore.shared.persistentContainer.viewContext.save()
    } catch let error {
      print("error saving pokemon \(error.localizedDescription)")
    }
  }
  
  func fetchPokemons()-> [Pokemon] {
    let context = CoreDataStore.shared.persistentContainer.viewContext
    let request = NSFetchRequest<Pokemon>(entityName: "Pokemon")
    do {
      let result = try context.fetch(request)
      var pokemons = [Pokemon]()
      result.forEach { result in
        pokemons.append(result)
      }
    } catch {
      return []
    }
    return []
  }
}
