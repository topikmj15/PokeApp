//
//  MainMenuViewModel.swift
//  PokeApp
//
//  Created by Topik Mujianto on 20/08/21.
//

import UIKit

class MainMenuViewModel: BaseViewModel {
  let pokemon =  Observable<[Pokemon]>()
  func doGetPokemonList(isForcedUpdate: Bool) {
    loadData.property = true
    DataSource.current.doGetPokemonList(param: ["limit": 10], onSuccess: { response in
      self.loadData.property = false
      self.pokemon.property = response
    }, onFailure: { (errorMessage, code) in
      self.loadData.property = false
      self.loadError.property = errorMessage
    })
  }
}

extension MainMenuViewModel {
  func navigateToDetailsPage(from vc: UIViewController, item: Pokemon?) {
    Navigation.toDetailsPage(from: vc, data: ["pokemon": item])
  }
}
