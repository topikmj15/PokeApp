//
//  PokemonTableViewCell.swift
//  PokeApp
//
//  Created by GMV on 21/08/21.
//

import UIKit
import PureLayout
import Kingfisher

class PokemonTableViewCell: BaseTableViewCell {
  // MARK: Property
  var pokeIdLbl: UILabel!
  var pokeNameLbl: UILabel!
  var pokeImageVw: UIImageView!
  var containerVw: UIView!
  
  override var item: Any? {
    didSet {
      guard let item = item as? Pokemon else { return }
      pokeNameLbl.text = item.name
      pokeIdLbl.text = String(format: "#%03d", item.id)
      pokeImageVw.kf.setImage(with: item.sprites?.frontDefault)
    }
  }
  
  // MARK: Function
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    initView()
    initConstraint()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func initConstraint() {
    containerVw.autoPinEdgesToSuperviewEdges(with: .zero)
    
    pokeImageVw.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
    pokeImageVw.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16, relation: .greaterThanOrEqual)
    pokeImageVw.autoPinEdge(toSuperviewEdge: .top, withInset: 16)
    pokeImageVw.autoPinEdge(toSuperviewEdge: .bottom, withInset: 16)
    pokeImageVw.autoSetDimensions(to: CGSize(width: 50, height: 50))
    
    pokeNameLbl.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
    pokeNameLbl.autoPinEdge(.top, to: .top, of: pokeImageVw, withOffset: 0)
    pokeNameLbl.autoPinEdge(.leading, to: .trailing, of: pokeImageVw, withOffset: 8)
    
    pokeIdLbl.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
    pokeIdLbl.autoPinEdge(.leading, to: .trailing, of: pokeImageVw, withOffset: 8)
    pokeIdLbl.autoPinEdge(.top, to: .bottom, of: pokeNameLbl, withOffset: 8)
  }
  
  override func initView() {
    containerVw = UIView(frame: .zero)
    contentView.addSubview(containerVw)
    
    pokeNameLbl = UILabel(frame: .zero)
    pokeNameLbl.textColor = UIColor(hex: "#2C3E50")
    containerVw.addSubview(pokeNameLbl)
    
    pokeIdLbl = UILabel(frame: .zero)
    pokeIdLbl.textColor = UIColor(hex: "#95A5A6")
    containerVw.addSubview(pokeIdLbl)
    
    pokeImageVw = UIImageView(frame: .zero)
    pokeImageVw.contentMode = .scaleAspectFit
    containerVw.addSubview(pokeImageVw)
  }
}
