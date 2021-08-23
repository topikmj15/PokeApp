//
//  WeaknessCollectionViewCell.swift
//  PokeApp
//
//  Created by Topik Mujianto on 23/08/21.
//

import UIKit
import PureLayout
import Kingfisher

class WeaknessCollectionViewCell: BaseCollectionViewCell {
  // MARK: Property
  var typeImageVw: UIImageView!
  var typeNameLbl: UILabel!
  
  var item: Any? {
    didSet {
      guard let item = item as? String else { return }
      typeImageVw.image = UIImage(named: item)
      typeNameLbl.text = item
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initView()
    initConstraint()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func initConstraint() {
    typeImageVw.autoPinEdge(toSuperviewEdge: .leading, withInset: 0, relation: .greaterThanOrEqual)
    typeImageVw.autoSetDimensions(to: CGSize(width: 25, height: 25))
    typeImageVw.autoAlignAxis(toSuperviewAxis: .horizontal)
    
    typeNameLbl.autoPinEdge(.leading, to: .trailing, of: typeImageVw, withOffset: 8)
    typeNameLbl.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16, relation: .greaterThanOrEqual)
    typeNameLbl.autoAlignAxis(.horizontal, toSameAxisOf: typeImageVw)
  }
  
  override func initView() {
    backgroundColor = .white
    
    typeImageVw = UIImageView(frame: .zero)
    typeImageVw.image = UIImage(named: "bug")
    contentView.addSubview(typeImageVw)
    
    typeNameLbl = UILabel(frame: .zero)
    typeNameLbl.text = "Fire"
    typeNameLbl.font = UIFont.systemFont(ofSize: 12)
    contentView.addSubview(typeNameLbl)
  }
}
