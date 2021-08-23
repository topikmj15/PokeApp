//
//  BaseView.swift
//  PokeApp
//
//  Created by Topik Mujianto on 21/08/21.
//

import UIKit
import PureLayout

class BaseView: UIView {
  // MARK: Properties
  var shouldSetupConstraints = true
  
  private static var name: String {
    let type = String(describing: self)
    return type
  }
  
  var item: Any?
  
  var controller: UIViewController?
  
  // MARK: Function
  override func updateConstraints() {
    if shouldSetupConstraints {
      self.initConstraint()
      // Auto Layout Constraints
      shouldSetupConstraints = false
    }
    super.updateConstraints()
  }
  
  func instantiate(controller from: UIViewController) {
    controller = from
    instantiateView(from: from.view)
  }
  
  func instantiateView(from view: UIView) {
    view.addSubview(self)
    self.autoPinEdgesToSuperviewEdges(with: .zero)
  }
  
  func initConstraint() {
    // Override this to init your constraint
  }
  
  func setButtonHandler(handler: ((UIView)->())?) {
    // Override this to set the button action
  }
  
  func setBarButtonItemHandler(handler: ((UIBarButtonItem)->())?) {
    // Override this to set the bar button item action
  }
  
  func dataSource(to vc: UIViewController) {
    // Override this to set datasource
  }
  
  func reloadList() {
    // Override this to reload list
  }
  
  
}

