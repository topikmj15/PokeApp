//
//  MainMenuViewModel.swift
//  PokeApp
//
//  Created by GMV on 20/08/21.
//

import UIKit

class MainMenuViewModel: BaseViewModel {
  let pokemon =  Observable<[Pokemon]>()
  func doGetPokemon(isForcedUpdate: Bool) {
    loadData.property = true
    dataSource(isForcedUpdate).doGetPokemon(param: ["limit": 10], onSuccess: { response in
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
