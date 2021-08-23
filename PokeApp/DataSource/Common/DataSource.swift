//
//  ApiDataSource.swift
//  PokeApp
//
//  Created by Topik Mujianto on 20/08/21.
//

import Foundation
import CoreData

class DataSource {
  static let latest = DataSource()
  static let current = DataSource(true)
  
  private var isForcedUpdate: Bool
  typealias onFailure = (_ message: String, _ code: Int?)-> Void
  
  init(_ isForcedUpdate: Bool = true) {
    self.isForcedUpdate = isForcedUpdate
  }
  
  func doGetPokemonList(param: [String: Any], onSuccess: @escaping ([Pokemon])->Void, onFailure: @escaping onFailure) {
    let pokemons = CoreDataStore.shared.fetchPokemons()
    if pokemons.count > 0 {
      onSuccess(pokemons)
      return
    }
    if isForcedUpdate {
      BaseRequest.request(from: RouteRequest.doGetPokemonList(param: param), onSuccess: { (response: BaseResponse<[Pokemon]>) in
        guard let pokemons = response.results else {
          onSuccess([])
          return
        }
        
        let group = DispatchGroup()
        var newData = [Pokemon]()
        for (poke) in pokemons {
          group.enter()
          let pokeId = Int64(poke.url?.components(separatedBy: "/").last ?? "0")
          self.doGetPokemonDetail(pokeId: pokeId ?? 0, onSuccess: { response in
            let newPokemon = Pokemon(id: pokeId ?? 0,
                                     name: poke.name,
                                     sprites: response.sprites,
                                     types: response.types,
                                     abilities: response.abilities,
                                     stats: response.stats)
            newData.append(newPokemon)
            group.leave()
          }) { (errorMessage, code) in
            onFailure(errorMessage, code)
          }
        }
        
        group.notify(queue: .main) {
          newData.forEach { CoreDataStore.shared.savePokemon($0) }
          onSuccess(newData)
        }
      }) { (errorMessage, code) in
        onFailure(errorMessage, code)
      }
    } else {
      // TODO: Get data from core data
    }
  }
  
  func doGetPokemonDetail(pokeId: Int64, onSuccess: @escaping (PokemonDetail)->Void, onFailure: @escaping onFailure) {
    BaseRequest.request(from: RouteRequest.doGetPokemonDetail(pokeId: pokeId), onSuccess: { (response: PokemonDetail) in
      onSuccess(response)
    }) { (errorMessage, code) in
      onFailure(errorMessage, code)
    }
  }
  
  func doGetPokemonSpecies(pokeId: Int64,  onSuccess: @escaping (Species)->Void, onFailure: @escaping onFailure) {
    BaseRequest.request(from: RouteRequest.doGetPokemonSpecies(pokeId: pokeId), onSuccess: { (response: Species) in
      onSuccess(response)
    }, onFailure: { (errorMessage, code) in
      onFailure(errorMessage, code)
    })
  }
  
  func doGetEvolutionChain(pokeId: Int64, onSuccess: @escaping (Chain?)->Void, onFailure: @escaping onFailure) {
    BaseRequest.request(from: RouteRequest.doGetEvolutionChain(pokeId: pokeId), onSuccess: { (response: BaseResponse<Chain>) in
      onSuccess(response.chain)
    }, onFailure: { (errorMessage, code) in
      onFailure(errorMessage, code)
    })
  }
  
  func doGetPokemonType(pokeId: Int64, onSuccess: @escaping (Type)->Void, onFailure: @escaping onFailure) {
    BaseRequest.request(from: RouteRequest.doGetPokemonType(pokeId: pokeId), onSuccess: { (response: Type) in
      onSuccess(response)
    }, onFailure: { (errorMessage, code) in
      onFailure(errorMessage, code)
    })
  }
}
