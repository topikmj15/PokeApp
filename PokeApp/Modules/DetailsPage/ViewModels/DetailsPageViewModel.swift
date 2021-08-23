//
//  DetailsPageViewModel.swift
//  PokeApp
//
//  Created by Topik Mujianto on 21/08/21.
//

import UIKit

class DetailsPageViewModel: BaseViewModel {
  let pokemonSpecies = Observable<Species>()
  let pokemonTypes = Observable<[String]>()
  let updateChains = Observable<[Chain]>()
  
  private var chains = [Chain]()
  
  func doGetPokemonSpecies(pokeId: Int64) {
    loadData.property = true
    DataSource.current.doGetPokemonSpecies(pokeId: pokeId, onSuccess: { response in
      self.loadData.property = false
      self.pokemonSpecies.property = response
    }, onFailure: { (errorMessage, code) in
      self.loadData.property = false
      self.loadError.property = errorMessage
    })
  }
  
  func doGetPokemonType(pokeId: Int64) {
    loadData.property = true
    DataSource.current.doGetPokemonType(pokeId: pokeId, onSuccess: { response in
      self.loadData.property = false
      let string = response.damageRelations?.doubleDamageFrom.map { $0.name }
      self.pokemonTypes.property = string ?? []
    }, onFailure: { (errorMessage, code) in
      self.loadData.property = false
      self.loadError.property = errorMessage
    })
  }
  
  func doGetEvolutionChain(pokeId: Int64) {
    loadData.property = true
    DataSource.current.doGetEvolutionChain(pokeId: pokeId, onSuccess: { response in
      self.loadData.property = false
      self.displaceChain(chain: response)
      self.updateChains.property = self.chains
    }, onFailure: { (errorMessage, code) in
      self.loadData.property = false
      self.loadError.property = errorMessage
    })
  }
  
}

extension DetailsPageViewModel {
  private func displaceChain(chain: Chain?) {
    if let evolveTo = chain?.evolvesTo.first,
       let evolutionDetail = evolveTo.evolutionDetails.first {
      chains.append(
        Chain(fromName: chain?.species?.name ?? "",
              toName: evolveTo.species?.name ?? "",
              level: evolutionDetail.minLevel ?? 0,
              fromImageURL: "",
              toImageURL: ""))
      self.displaceChain(chain: evolveTo)
    }
  }
}
