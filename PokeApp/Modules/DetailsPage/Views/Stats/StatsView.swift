//
//  StatsView.swift
//  PokeApp
//
//  Created by Topik Mujianto on 22/08/21.
//

import UIKit
import PureLayout
import ChameleonFramework

class StatsView: BaseView {
  // MARK: Property
  var contentVw: UIView!
  var statsNameLbl: UILabel!
  var statsValueLbl: UILabel!
  var statsProgressVw: UIProgressView!
  
  // MARK: Function
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureContent()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func initConstraint() {
    contentVw.autoPinEdgesToSuperviewEdges(with: .zero)
    contentVw.autoSetDimension(.height, toSize: 20)
    
    statsNameLbl.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
    statsNameLbl.autoSetDimension(.width, toSize: 35)
    statsNameLbl.autoAlignAxis(toSuperviewAxis: .horizontal)
    
    statsValueLbl.autoPinEdge(.leading, to: .trailing, of: statsNameLbl, withOffset: 16)
    statsValueLbl.autoSetDimension(.width, toSize: 32)
    statsValueLbl.autoAlignAxis(.horizontal, toSameAxisOf: statsNameLbl)
    
    statsProgressVw.autoPinEdge(.leading, to: .trailing, of: statsValueLbl, withOffset: 8)
    statsProgressVw.autoAlignAxis(.horizontal, toSameAxisOf: statsValueLbl)
    statsProgressVw.autoSetDimension(.height, toSize: 5)
    statsProgressVw.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
  }
  
  func configureContent() {
    contentVw = UIView(frame: .zero)
    addSubview(contentVw)
    
    statsNameLbl = UILabel(frame: .zero)
    statsNameLbl.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
    statsNameLbl.textColor = UIColor(hex: "#63A8E1")
    contentVw.addSubview(statsNameLbl)
    
    statsValueLbl = UILabel(frame: .zero)
    statsValueLbl.font = UIFont.systemFont(ofSize: 12)
    statsValueLbl.textColor = .black
    contentVw.addSubview(statsValueLbl)
    
    statsProgressVw = UIProgressView(frame: .zero)
    statsProgressVw.progressTintColor = UIColor(hex: "#63A8E1")
    contentVw.addSubview(statsProgressVw)
  }
}
