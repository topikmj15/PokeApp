//
//  MainMenuView.swift
//  PokeApp
//
//  Created by GMV on 21/08/21.
//

import UIKit
import PureLayout

class MainMenuView: BaseView {
  // MARK: Properties
  /// Container
  var tableView: UITableView!
  
  // MARK: Function
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureContent()
  }
  
  override func initConstraint() {
    tableView.autoPinEdgesToSuperviewEdges()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureContent() {
    backgroundColor = .white
    tableView = UITableView(frame: .zero)
    tableView.register(PokemonTableViewCell.self,
                       forCellReuseIdentifier: PokemonTableViewCell.identifier)
    tableView.tableFooterView = UIView()
    addSubview(tableView)
  }
  
  func dataSource(to vc: UIViewController) {
    tableView.dataSource = vc as? UITableViewDataSource
    tableView.delegate = vc as? UITableViewDelegate 
  }
  
  func reloadList() {
    tableView.reloadData()
  }
}
