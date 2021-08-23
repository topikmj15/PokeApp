//
//  DetailsPageView.swift
//  PokeApp
//
//  Created by GMV on 21/08/21.
//

import UIKit
import PureLayout
import ChameleonFramework

class DetailsPageView: BaseView {
  // MARK: Properties
  /// For handler
  var isStats = true
  
  /// Container
  var scrollVw: UIScrollView!
  var contentVw: UIView!
  var bgContentVw: UIView!
  
  /// Description
  var charImageVw: UIImageView!
  var charNameLbl: UILabel!
  var charDescriptionLbl: UILabel!
  
  /// Tab
  var tabStackVw: UIStackView!
  var containerStatsVw: UIView!
  var statsLbl: UILabel!
  var statsBtn: CustomButton!
  var containerEvolutionsVw: UIView!
  var evolutionsLbl: UILabel!
  var evolutionBtn: CustomButton!
  
  // MARK: Function
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureContainer()
    configureDescription()
    configureSkillTab()
  }
  
  override func setButtonHandler(handler: ((UIView) -> ())?) {
    statsBtn.addHandlerButton(handler: handler)
    evolutionBtn.addHandlerButton(handler: handler)
  }
  
  override func initConstraint() {
    // Container
    bgContentVw.autoPinEdgesToSuperviewEdges()
    
    scrollVw.autoPinEdgesToSuperviewEdges()
    contentVw.autoPinEdgesToSuperviewEdges()
    contentVw.autoMatch(.width, to: .width, of: scrollVw)
    NSLayoutConstraint.autoSetPriority(.defaultLow) { [weak self] in
      self?.contentVw.autoMatch(.height, to: .height, of: scrollVw)
    }
    
    // Description
    charImageVw.autoAlignAxis(toSuperviewAxis: .vertical)
    charImageVw.autoSetDimensions(to: CGSize(width: 100, height: 100))
    charImageVw.autoPinEdge(toSuperviewEdge: .top, withInset: -(100 / 1.5))
    
    charNameLbl.autoAlignAxis(.vertical, toSameAxisOf: charImageVw)
    charNameLbl.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
    charNameLbl.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
    charNameLbl.autoPinEdge(.top, to: .bottom, of: charImageVw, withOffset: 20)
    
    charDescriptionLbl.autoPinEdge(.top, to: .bottom, of: charNameLbl, withOffset: 16)
    charDescriptionLbl.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
    charDescriptionLbl.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
    
    // Tab
    tabStackVw.autoPinEdge(.top, to: .bottom, of: charDescriptionLbl, withOffset: 24)
    tabStackVw.autoPinEdge(toSuperviewEdge: .leading, withInset: 32)
    tabStackVw.autoPinEdge(toSuperviewEdge: .trailing,  withInset: 32)
    tabStackVw .autoPinEdge(toSuperviewEdge: .bottom, withInset: 16, relation: .greaterThanOrEqual)
    
    containerStatsVw.autoSetDimensions(to: CGSize(width: 50, height: 40))
    statsLbl.autoAlignAxis(.vertical, toSameAxisOf: containerStatsVw)
    statsLbl.autoAlignAxis(.horizontal, toSameAxisOf: containerStatsVw)
    statsBtn.autoMatch(.height, to: .height, of: containerStatsVw)
    statsBtn.autoMatch(.width, to: .width, of: containerStatsVw)
    statsBtn.autoAlignAxis(.vertical, toSameAxisOf: containerStatsVw)
    statsBtn.autoAlignAxis(.horizontal, toSameAxisOf: containerStatsVw)
    
    containerEvolutionsVw.autoSetDimensions(to: CGSize(width: 60, height: 40))
    evolutionsLbl.autoAlignAxis(.vertical, toSameAxisOf: containerEvolutionsVw)
    evolutionsLbl.autoAlignAxis(.horizontal, toSameAxisOf: containerEvolutionsVw)
    evolutionBtn.autoMatch(.height, to: .height, of: containerEvolutionsVw)
    evolutionBtn.autoMatch(.width, to: .width, of: containerEvolutionsVw)
    evolutionBtn.autoAlignAxis(.vertical, toSameAxisOf: containerEvolutionsVw)
    evolutionBtn.autoAlignAxis(.horizontal, toSameAxisOf: containerEvolutionsVw)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureContainer() {
    backgroundColor = .white
    bgContentVw = UIView(frame: .zero)
    self.bgContentVw.backgroundColor = UIColor(gradientStyle: .leftToRight, withFrame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60), andColors: [UIColor(hex: "#63A8E1"), UIColor(hex: "#77BFE1")])
    addSubview(bgContentVw)
    
    scrollVw = UIScrollView(frame: .zero)
    scrollVw.showsVerticalScrollIndicator = false
    scrollVw.alwaysBounceVertical = true
    scrollVw.contentInset = UIEdgeInsets(top: 70, left: 0, bottom: 0, right: 0)
    addSubview(scrollVw)
    
    contentVw = UIView(frame: .zero)
    contentVw.layer.cornerRadius = 40
    contentVw.backgroundColor = .white
    scrollVw.addSubview(contentVw)
  }
  
  private func configureDescription() {
    charImageVw = UIImageView(frame: .zero)
    charImageVw.image = UIImage(named: "ic_poke_app")
    charImageVw.contentMode = .scaleAspectFit
    charImageVw.clipsToBounds = true
    contentVw.addSubview(charImageVw)
    
    charNameLbl = UILabel(frame: .zero)
    charNameLbl.font = UIFont.boldSystemFont(ofSize: 25)
    charNameLbl.text = "Test Title Dummy"
    charNameLbl.textAlignment = .center
    contentVw.addSubview(charNameLbl)
    
    charDescriptionLbl = UILabel(frame: .zero)
    charDescriptionLbl.font =  UIFont.systemFont(ofSize: 16)
    charDescriptionLbl.text = "Test Dummy"
    charDescriptionLbl.lineBreakMode = .byWordWrapping
    charDescriptionLbl.textAlignment = .center
    charDescriptionLbl.numberOfLines = 0
    contentVw.addSubview(charDescriptionLbl)
  }
  
  func configureSkillTab() {
    tabStackVw = UIStackView(frame: .zero)
    tabStackVw.distribution = .fillProportionally
    tabStackVw.alignment = .center
    tabStackVw.axis = .horizontal
    tabStackVw.spacing = 16
    contentVw.addSubview(tabStackVw)
    
    let cornerRadius: CGFloat = 20
    containerStatsVw = UIView(frame: .zero)
    containerStatsVw.backgroundColor = UIColor(hex: "#63A8E1")
    containerStatsVw.layer.cornerRadius = cornerRadius
    tabStackVw.addArrangedSubview(containerStatsVw)
    
    statsLbl = UILabel(frame: .zero)
    statsLbl.text = "STATS"
    statsLbl.textColor = .white
    statsLbl.textAlignment = .center
    statsLbl.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    containerStatsVw.addSubview(statsLbl)
    
    statsBtn = CustomButton(frame: .zero)
    statsBtn.backgroundColor = .clear
    containerStatsVw.addSubview(statsBtn)
    
    containerEvolutionsVw = UIView(frame: .zero)
    containerEvolutionsVw.layer.cornerRadius = cornerRadius
    containerEvolutionsVw.backgroundColor = .clear
    tabStackVw.addArrangedSubview(containerEvolutionsVw)
    
    evolutionsLbl = UILabel(frame: .zero)
    evolutionsLbl.text = "EVOLUTIONS"
    evolutionsLbl.textColor = UIColor(hex: "#63A8E1")
    evolutionsLbl.textAlignment = .center
    evolutionsLbl.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    containerEvolutionsVw.addSubview(evolutionsLbl)
    
    evolutionBtn = CustomButton(frame: .zero)
    evolutionBtn.backgroundColor = .clear
    containerEvolutionsVw.addSubview(evolutionBtn)
  }
}


extension DetailsPageView {
  func onSelectedTab() {
    if isStats {
      containerStatsVw.backgroundColor = UIColor(hex: "#63A8E1")
      statsLbl.textColor = .white
      evolutionsLbl.textColor = UIColor(hex: "#63A8E1")
      containerEvolutionsVw.backgroundColor = .clear
      isStats.toggle()
    } else {
      containerStatsVw.backgroundColor = .clear
      statsLbl.textColor = UIColor(hex: "#63A8E1")
      evolutionsLbl.textColor = .white
      containerEvolutionsVw.backgroundColor = UIColor(hex: "#63A8E1")
      isStats.toggle()
    }
  }
}
