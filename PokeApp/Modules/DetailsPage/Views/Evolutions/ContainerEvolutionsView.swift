//
//  EvolutionsView.swift
//  PokeApp
//
//  Created by Topik Mujianto on 22/08/21.
//

import UIKit
import PureLayout
import ChameleonFramework

class ContainerEvolutionsView: BaseView {
  // MARK: Property
  /// Container
  var contentVw: UIView!
  var stackVw: UIStackView!
  
  // MARK: Function
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureContainer()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func initConstraint() {
    contentVw.autoPinEdgesToSuperviewEdges()
    stackVw.autoPinEdgesToSuperviewEdges()
  }
  
  func configureContainer() {
    contentVw = UIView(frame: .zero)
    addSubview(contentVw)
    
    stackVw = UIStackView(frame: .zero)
    stackVw.distribution = .fill
    stackVw.alignment = .leading
    stackVw.axis = .vertical
    contentVw.addSubview(stackVw)
  }
}
