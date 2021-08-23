//
//  EvolutionsView.swift
//  PokeApp
//
//  Created by GMV on 22/08/21.
//

import UIKit
import PureLayout
import ChameleonFramework

class EvolutionsView: BaseView {
  // MARK: Property
  /// Container
  var contentVw: UIView!
  
  // MARK: Function
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureContainer()
    configureContent()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func setButtonHandler(handler: ((UIView) -> ())?) {
    
  }
  
  override func initConstraint() {
    contentVw.autoPinEdgesToSuperviewEdges(with: .zero)
  }
  
  func configureContainer() {
    contentVw = UIView(frame: .zero)
    addSubview(contentVw)
  }
  
  func configureContent() {
    
  }
}
