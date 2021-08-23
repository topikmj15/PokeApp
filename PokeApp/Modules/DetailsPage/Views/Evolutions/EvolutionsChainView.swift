//
//  EvolutionsChainView.swift
//  PokeApp
//
//  Created by Topik Mujianto on 23/08/21.
//

import UIKit
import PureLayout

class EvolutionsChainView: BaseView {
  // MARK: Property
  var contentVw: UIView!
  
  var containerFromVw: UIView!
  var fromNameLbl: UILabel!
  var fromImageVw: UIImageView!
  
  var levelLbl: UILabel!
  var arrowImageVw: UIImageView!
  
  var containerToVw: UIView!
  var toNameLbl: UILabel!
  var toImageVw: UIImageView!
  
  // MARK: Function
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureContent()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func initConstraint() {

    contentVw.autoPinEdgesToSuperviewEdges()
    
    containerFromVw.autoPinEdge(toSuperviewEdge: .top)
    containerFromVw.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
    containerFromVw.autoPinEdge(toSuperviewEdge: .bottom, withInset: 16)
    containerFromVw.autoSetDimension(.width, toSize: 80)
    
    fromImageVw.autoPinEdge(toSuperviewEdge: .top, withInset: 8)
    fromImageVw.autoAlignAxis(.vertical, toSameAxisOf: containerFromVw)
    fromImageVw.autoSetDimensions(to: CGSize(width: 50, height: 50))
    
    fromNameLbl.autoPinEdge(.top, to: .bottom, of: fromImageVw, withOffset: 8)
    fromNameLbl.autoAlignAxis(.vertical, toSameAxisOf: containerFromVw)
    fromNameLbl.autoPinEdge(toSuperviewEdge: .bottom)
    
    levelLbl.autoAlignAxis(toSuperviewAxis: .vertical)
    levelLbl.autoPinEdge(toSuperviewEdge: .top, withInset: 16)
    
    arrowImageVw.autoPinEdge(.top, to: .bottom, of: levelLbl, withOffset: 8)
    arrowImageVw.autoAlignAxis(.vertical, toSameAxisOf: levelLbl)
    
    containerToVw.autoPinEdge(toSuperviewEdge: .top)
    containerToVw.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
    containerToVw.autoPinEdge(toSuperviewEdge: .bottom, withInset: 16)
    containerToVw.autoSetDimension(.width, toSize: 80)
    
    toImageVw.autoPinEdge(toSuperviewEdge: .top)
    toImageVw.autoAlignAxis(.vertical, toSameAxisOf: containerToVw)
    toImageVw.autoSetDimensions(to: CGSize(width: 50, height: 50))
    
    toNameLbl.autoPinEdge(.top, to: .bottom, of: toImageVw, withOffset: 8)
    toNameLbl.autoAlignAxis(.vertical, toSameAxisOf: containerToVw)
    toNameLbl.autoPinEdge(toSuperviewEdge: .bottom)
  }
  
  func configureContent() {
    contentVw = UIView(frame: .zero)
    addSubview(contentVw)
    
    containerFromVw = UIView(frame: .zero)
    contentVw.addSubview(containerFromVw)
    
    fromImageVw = UIImageView(frame: .zero)
    fromImageVw.image = UIImage(named: "bug")
    fromImageVw.contentMode = .scaleAspectFit
    containerFromVw.addSubview(fromImageVw)
    
    fromNameLbl = UILabel(frame: .zero)
    fromNameLbl.text = "Squirtle"
    fromNameLbl.textAlignment = .center
    containerFromVw.addSubview(fromNameLbl)
    
    levelLbl = UILabel(frame: .zero)
    levelLbl.text = "Lv. 16"
    levelLbl.textAlignment = .center
    contentVw.addSubview(levelLbl)
    
    containerToVw = UIView(frame: .zero)
    contentVw.addSubview(containerToVw)
    
    arrowImageVw = UIImageView(frame: .zero)
    arrowImageVw.image = UIImage(named: "ic_arrow_right")
    arrowImageVw.contentMode = .scaleAspectFit
    contentVw.addSubview(arrowImageVw)
    
    toImageVw = UIImageView(frame: .zero)
    toImageVw.image = UIImage(named: "bug")
    toImageVw.contentMode = .scaleAspectFit
    containerToVw.addSubview(toImageVw)
    
    toNameLbl = UILabel(frame: .zero)
    toNameLbl.text = "Wartortle"
    toNameLbl.textAlignment = .center
    containerToVw.addSubview(toNameLbl)
  }
}
