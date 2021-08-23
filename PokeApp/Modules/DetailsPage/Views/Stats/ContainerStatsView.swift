//
//  StatsView.swift
//  PokeApp
//
//  Created by GMV on 22/08/21.
//

import UIKit
import PureLayout
import ChameleonFramework

class StatsView: BaseView {
  // MARK: Property
  /// Container
  var contentVw: UIView!
  
  var statsStackVw: UIStackView!
  var containerStatsVw: UIView!
  var statsNameLbl: UILabel!
  var statsValueLbl: UILabel!
  var statsProgressVw: UIProgressView!
  
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
  
  func configureStats() {
    statsStackVw = UIStackView(frame: .zero)
    statsStackVw.distribution = .fill
    statsStackVw.alignment = .fill
    statsStackVw.axis = .vertical
    contentVw.addSubview(statsStackVw)
  }
}
