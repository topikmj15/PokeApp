//
//  PokemonTableViewCell.swift
//  PokeApp
//
//  Created by Topik Mujianto on 21/08/21.
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
  var typeStackVw: UIStackView!
  
  override var item: Any? {
    didSet {
      guard let item = item as? Pokemon else { return }
      pokeNameLbl.text = item.name
      pokeIdLbl.text = String(format: "#%03d", item.id)
      pokeImageVw.kf.setImage(with: item.sprites?.frontDefault)

      typeStackVw.arrangedSubviews.forEach { $0.removeFromSuperview()}
      item.types?.forEach {
        let imageVw = UIImageView(image: UIImage(named: $0.type?.name ?? ""))
        imageVw.autoSetDimensions(to: CGSize(width: 25, height: 25))
        typeStackVw.addArrangedSubview(imageVw)
      }
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
    containerVw.autoPinEdgesToSuperviewEdges()
    
    pokeImageVw.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
    pokeImageVw.autoPinEdge(toSuperviewEdge: .top, withInset: 16)
    pokeImageVw.autoSetDimensions(to: CGSize(width: 50, height: 50))
    
    pokeNameLbl.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
    pokeNameLbl.autoPinEdge(.top, to: .top, of: pokeImageVw, withOffset: 0)
    pokeNameLbl.autoPinEdge(.leading, to: .trailing, of: pokeImageVw, withOffset: 8)
    
    pokeIdLbl.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
    pokeIdLbl.autoPinEdge(.leading, to: .trailing, of: pokeImageVw, withOffset: 8)
    pokeIdLbl.autoPinEdge(.top, to: .bottom, of: pokeNameLbl, withOffset: 8)
    
    typeStackVw.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
    typeStackVw.autoAlignAxis(.horizontal, toSameAxisOf: containerVw)
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
    pokeImageVw.clipsToBounds = true
    containerVw.addSubview(pokeImageVw)
    
    typeStackVw = UIStackView(frame: .zero)
    typeStackVw.distribution = .fill
    typeStackVw.alignment = .fill
    typeStackVw.axis = .horizontal
    typeStackVw.spacing = 8
    containerVw.addSubview(typeStackVw)
  }
}
