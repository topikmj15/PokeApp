//
//  MainMenuViewController.swift
//  PokeApp
//
//  Created by Topik Mujianto on 21/08/21.
//

import UIKit

class MainMenuViewController: BaseViewController {
  // MARK: Property
  var mainMenuVw = MainMenuView(frame: .zero)
  var viewModel = MainMenuViewModel()
  
  // MARK: Function
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.addBlurEffect()
    navigationController?.navigationBar.shadowImage = UIImage()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
    observable()
    
    viewModel.doGetPokemonList(isForcedUpdate: true)
  }
  
  override func configureView() {
    title = "Pokemon"
    mainMenuVw.instantiate(controller: self)
    mainMenuVw.dataSource(to: self)
  }
  
  override func observable() {
    // Load data
    viewModel.pokemon.observe = { obj in
      self.mainMenuVw.reloadList()
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


extension MainMenuViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.pokemon.property?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.identifier, for: indexPath) as! PokemonTableViewCell
    let item = viewModel.pokemon.property?[indexPath.row]
    cell.item = item
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let item = viewModel.pokemon.property?[indexPath.row]
    viewModel.navigateToDetailsPage(from: self, item: item)
  }
}
