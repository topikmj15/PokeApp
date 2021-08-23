//
//  DetailsPageView.swift
//  PokeApp
//
//  Created by Topik Mujianto on 21/08/21.
//

import UIKit
import PureLayout
import ChameleonFramework
import Kingfisher

class DetailsPageView: BaseView {
  // MARK: Properties
  /// For handler
  var isStats = true
  
  /// Container
  var scrollVw: UIScrollView!
  var contentVw: UIView!
  var bgContentVw: UIView!
  
  /// Type
  var containerTypeVw: UIView!
  var typeImageVw: UIImageView!
  var typeNameLbl: UILabel!
  
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
  
  /// Stats & Evolutions
  var containerTabStackVw: UIStackView!
  var statsVw: ContainerStatsView!
  var evolutionsVw: ContainerEvolutionsView!
  
  // MARK: Function
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureContainer()
    configureType()
    configureDescription()
    configureSkillTab()
  }
  
  override func setButtonHandler(handler: ((UIView) -> ())?) {
    statsBtn.addHandlerButton(handler: handler)
    evolutionBtn.addHandlerButton(handler: handler)
  }
  
  override func dataSource(to vc: UIViewController) {
    statsVw.weaknessCollectionVw.dataSource = vc as? UICollectionViewDataSource
  }
  
  override func reloadList() {
    statsVw.weaknessCollectionVw.reloadData()
  }
  
  override func initConstraint() {
    // Container
    bgContentVw.autoPinEdgesToSuperviewEdges()
    
    scrollVw.autoPinEdgesToSuperviewEdges()
    contentVw.autoPinEdgesToSuperviewEdges()
    contentVw.autoMatch(.width, to: .width, of: scrollVw)
    NSLayoutConstraint.autoSetPriority(.fittingSizeLevel) { [weak self] in
      self?.contentVw.autoMatch(.height, to: .height, of: scrollVw)
    }
    
    // Description
    charImageVw.autoAlignAxis(toSuperviewAxis: .vertical)
    charImageVw.autoSetDimensions(to: CGSize(width: 150, height: 150))
    charImageVw.autoPinEdge(toSuperviewEdge: .top, withInset: -(150 / 1.5))
    
    charNameLbl.autoAlignAxis(.vertical, toSameAxisOf: charImageVw)
    charNameLbl.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
    charNameLbl.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
    charNameLbl.autoPinEdge(.top, to: .bottom, of: charImageVw, withOffset: 20)
    
    containerTypeVw.autoPinEdge(.top, to: .bottom, of: charNameLbl, withOffset: 16)
    containerTypeVw.autoSetDimension(.height, toSize: 30)
    containerTypeVw.autoAlignAxis(.vertical, toSameAxisOf: charImageVw)
    
    /// Type
    typeImageVw.autoPinEdge(toSuperviewEdge: .leading, withInset: 8)
    typeImageVw.autoSetDimensions(to: CGSize(width: 20, height: 20))
    typeImageVw.autoAlignAxis(toSuperviewAxis: .horizontal)
    
    typeNameLbl.autoPinEdge(.leading, to: .trailing, of: typeImageVw, withOffset: 8)
    typeNameLbl.autoPinEdge(toSuperviewEdge: .trailing, withInset: 8)
    typeNameLbl.autoAlignAxis(.horizontal, toSameAxisOf: typeImageVw)
    
    charDescriptionLbl.autoPinEdge(.top, to: .bottom, of: containerTypeVw, withOffset: 16)
    charDescriptionLbl.autoPinEdge(toSuperviewEdge: .leading, withInset: 8)
    charDescriptionLbl.autoPinEdge(toSuperviewEdge: .trailing, withInset: 8)
    
    // Tab
    tabStackVw.autoPinEdge(.top, to: .bottom, of: charDescriptionLbl, withOffset: 24)
    tabStackVw.autoPinEdge(toSuperviewEdge: .leading, withInset: 32)
    tabStackVw.autoPinEdge(toSuperviewEdge: .trailing,  withInset: 32)
    
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
    
    // Stats Content
    containerTabStackVw.autoPinEdge(.top, to: .bottom, of: tabStackVw, withOffset: 24)
    containerTabStackVw.autoPinEdge(toSuperviewEdge: .leading)
    containerTabStackVw.autoPinEdge(toSuperviewEdge: .trailing)
    containerTabStackVw.autoPinEdge(toSuperviewEdge: .bottom, withInset: 32)
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
    scrollVw.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
    addSubview(scrollVw)
    
    contentVw = UIView(frame: .zero)
    contentVw.layer.cornerRadius = 40
    contentVw.backgroundColor = .white
    scrollVw.addSubview(contentVw)
  }
  
  private func configureType() {
    containerTypeVw = UIView(frame: .zero)
    containerTypeVw.backgroundColor = UIColor(hex: "#63A8E1")
    containerTypeVw.layer.cornerRadius = 15
    contentVw.addSubview(containerTypeVw)
    
    typeImageVw = UIImageView(frame: .zero)
    typeImageVw.image = UIImage(named: "bug")
    containerTypeVw.addSubview(typeImageVw)
    
    typeNameLbl = UILabel(frame: .zero)
    typeNameLbl.font = UIFont.systemFont(ofSize: 14)
    typeNameLbl.textColor = .white
    containerTypeVw.addSubview(typeNameLbl)
  }
  
  private func configureDescription() {
    charImageVw = UIImageView(frame: .zero)
    charImageVw.image = UIImage(named: "ic_poke_app")
    charImageVw.contentMode = .scaleToFill
    charImageVw.clipsToBounds = true
    contentVw.addSubview(charImageVw)
    
    charNameLbl = UILabel(frame: .zero)
    charNameLbl.font = UIFont.boldSystemFont(ofSize: 25)
    charNameLbl.textAlignment = .center
    contentVw.addSubview(charNameLbl)
    
    charDescriptionLbl = UILabel(frame: .zero)
    charDescriptionLbl.font =  UIFont.systemFont(ofSize: 16)
    charDescriptionLbl.numberOfLines = 10
    charDescriptionLbl.textAlignment = .center
    charDescriptionLbl.adjustsFontSizeToFitWidth = true
    charDescriptionLbl.lineBreakMode = .byClipping
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
    
    statsVw = ContainerStatsView(frame: .zero)
    contentVw.addSubview(statsVw)
    evolutionsVw = ContainerEvolutionsView(frame: .zero)
    
    containerTabStackVw = UIStackView(frame: .zero)
    containerTabStackVw.distribution = .fill
    containerTabStackVw.alignment = .fill
    containerTabStackVw.axis = .vertical
    contentVw.addSubview(containerTabStackVw)
    
    containerTabStackVw.addArrangedSubview(statsVw)
  }
}

// MARK: Helper
extension DetailsPageView {
  func onSelectedTab() {
    containerTabStackVw.arrangedSubviews.forEach {
      $0.removeFromSuperview()
    }
    
    if isStats {
      containerStatsVw.backgroundColor = UIColor(hex: "#63A8E1")
      statsLbl.textColor = .white
      evolutionsLbl.textColor = UIColor(hex: "#63A8E1")
      containerEvolutionsVw.backgroundColor = .clear
      containerTabStackVw.insertArrangedSubview(statsVw, at: 0)
      isStats.toggle()
    } else {
      containerStatsVw.backgroundColor = .clear
      statsLbl.textColor = UIColor(hex: "#63A8E1")
      evolutionsLbl.textColor = .white
      containerEvolutionsVw.backgroundColor = UIColor(hex: "#63A8E1")
      containerTabStackVw.insertArrangedSubview(evolutionsVw, at: 0)
      isStats.toggle()
    }
  }
}

// MARK: Binding Data
extension DetailsPageView {
  func bind(data: [String: Any?]) {
    if let poke = data["pokemon"] as? Pokemon {
      charNameLbl.text = poke.name?.capitalized
      charImageVw.kf.setImage(with: poke.sprites?.frontDefault)
      typeImageVw.image = UIImage(named: poke.types?.first?.type?.name ?? "")
      typeNameLbl.text = poke.types?.first?.type?.name
      
      // Stats
      statsVw.statsStackVw.arrangedSubviews.forEach { view in
        view.removeFromSuperview()
      }
      
      poke.stats?.forEach {
        let view = StatsView(frame: .zero)
        view.statsNameLbl.text = $0.name.label
        view.statsValueLbl.text =  "\($0.baseStat)"
        view.statsProgressVw.progress = Float($0.baseStat) / 100
        statsVw.statsStackVw.addArrangedSubview(view)
      }
      
      // Sprites Image
      statsVw.normalImageVw.kf.setImage(with: poke.sprites?.normal)
      statsVw.shinyImageVw.kf.setImage(with: poke.sprites?.shiny)
      
      // Abilities
      let abilityHeight = (20 * (poke.abilities?.count ?? 0))
      statsVw.setAbilityStackVw(height: CGFloat(abilityHeight))
      statsVw.abilityStackVw.arrangedSubviews.forEach {
        $0.removeFromSuperview()
      }
      
      poke.abilities?.forEach {
        let label = UILabel(frame: .zero)
        label.text = $0.name
        label.textColor = UIColor(hex: "#63A8E1")
        label.font = UIFont.systemFont(ofSize: 14)
        statsVw.abilityStackVw.addArrangedSubview(label)
      }
      
    }
  }
  
  func bind(species: Species) {
    // Description
    charDescriptionLbl.text = species.flavorText
    
    // Breeding
    statsVw.breedingVw.hatcTimeStepLbl.text = "\(species.hatchStep) Steps"
    statsVw.breedingVw.hatcTimeCycleLbl.text = "\(species.hatchCycle) Cycles"
    statsVw.breedingVw.genderStepLbl.text = "\(species.female) %"
    statsVw.breedingVw.genderCycleLbl.text = "\(species.male) %"
    
    let eggGroupString = species.eggGroups.map { $0.name }.joined(separator: "\n")
    statsVw.breedingVw.eggGroupValueLbl.text = eggGroupString
    
    // Capture
    statsVw.captureVw.habitatValueLbl.text = species.habitatName
    statsVw.captureVw.generationValueLbl.text = species.generationName
    statsVw.captureVw.rateValueLbl.text = "\(species.captureRate) %"
  }
  
  func bind(types: [String]) {
    let calculateHeight: CGFloat = types.count < 2 ? (30) : CGFloat(3 / types.count) * CGFloat(30)
    statsVw.weaknessCollectionVw.autoSetDimension(.height, toSize: calculateHeight)
    reloadList()
  }
  
  func bind(chains: [Chain]) {
    evolutionsVw.stackVw.arrangedSubviews.forEach { view in
      view.removeFromSuperview()
    }
    
    for chain in chains {
      let chainView = EvolutionsChainView(frame: .zero)
      chainView.fromNameLbl.text = chain.fromName
      chainView.toNameLbl.text = chain.toName
      if chain.level == 0 {
        chainView.levelLbl.text = " "
      }else{
        chainView.levelLbl.text = "Lv. \(chain.level ?? 0)"
      }
      
      evolutionsVw.stackVw.addArrangedSubview(chainView)
      chainView.autoPinEdge(toSuperviewEdge: .leading)
      chainView.autoPinEdge(toSuperviewEdge: .trailing)
    }
  }
}
