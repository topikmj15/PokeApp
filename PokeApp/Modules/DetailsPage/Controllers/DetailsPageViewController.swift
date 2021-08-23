//
//  DetailsPageViewController.swift
//  PokeApp
//
//  Created by Topik Mujianto on 21/08/21.
//

import UIKit

class DetailsPageViewController: BaseViewController {
  // MARK: Property
  private var detailsPageVw = DetailsPageView()
  private var viewModel = DetailsPageViewModel()
  
  // MARK: Function
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.configColorBar(colorBar: [UIColor(hex: "#63A8E1"), UIColor(hex: "#77BFE1")], colorTitle: .white, colorBarButton: .white)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.configBackButton()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.configColorBar(colorBar: [], colorTitle: .white, colorBarButton: .white)
  }
  
  override func viewDidLoad() {
    configureView()
    observable()
  }
  
  override func configureView() {
    detailsPageVw.instantiate(controller: self)
    detailsPageVw.dataSource(to: self)
    detailsPageVw.setButtonHandler { button in
      if button == self.detailsPageVw.statsBtn {
        self.detailsPageVw.onSelectedTab()
      } else if button == self.detailsPageVw.evolutionBtn {
        self.detailsPageVw.onSelectedTab()
      }
    }
  }
  
  override func configureData(data: [String : Any?]) {
    detailsPageVw.bind(data: data)
    
    let pokeId = (data["pokemon"] as? Pokemon)?.id ?? 0
    viewModel.doGetPokemonSpecies(pokeId: pokeId)
    viewModel.doGetPokemonType(pokeId: pokeId)
    viewModel.doGetEvolutionChain(pokeId: pokeId)
  }
  
  override func observable() {
    // Load data
    viewModel.updateChains.observe = { obj in
      self.detailsPageVw.bind(chains: obj)
    }
    
    viewModel.pokemonTypes.observe = { obj in
      self.detailsPageVw.bind(types: obj)
    }
    
    viewModel.pokemonSpecies.observe = { obj in
      self.detailsPageVw.bind(species: obj)
    }
    // Loading status
    viewModel.loadData.observe = { isLoading in
      UIHelper.showLoading(view: self.view, isLoading: isLoading)
    }
    // Error response
    viewModel.loadError.observe = { errorMessage in
      UIHelper.showMessage(body: errorMessage, option: [:])
    }
  }
}

extension DetailsPageViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.pokemonTypes.property?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeaknessCollectionViewCell.identifier, for: indexPath) as! WeaknessCollectionViewCell
    let item = viewModel.pokemonTypes.property?[indexPath.item]
    cell.item = item
    return cell
  }
}
