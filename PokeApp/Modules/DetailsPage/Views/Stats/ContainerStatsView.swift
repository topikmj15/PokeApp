//
//  StatsView.swift
//  PokeApp
//
//  Created by Topik Mujianto on 22/08/21.
//

import UIKit
import PureLayout
import ChameleonFramework

class ContainerStatsView: BaseView {
  // MARK: Property
  /// Container
  var contentVw: UIView!
  
  /// Stats
  var statsStackVw: UIStackView!
  
  /// Weakness
  var weaknessLbl: UILabel!
  var weaknessCollectionVw: UICollectionView!
  
  /// Abilities
  var abilitiesLbl: UILabel!
  var abilityStackVw: UIStackView!
  
  /// Breeding
  var breedingLbl: UILabel!
  var breedingVw: BreedingView!
  
  /// Capture
  var captureLbl: UILabel!
  var captureVw: CaptureView!
  
  /// Spriters
  var spritesLbl: UILabel!
  var spritesStackVw: UIStackView!
  
  var containerNormalVw: UIView!
  var normalLbl: UILabel!
  var normalImageVw: UIImageView!
  
  var containerShinyVw: UIView!
  var shinyLbl: UILabel!
  var shinyImageVw: UIImageView!
  
  
  // MARK: Function
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureContainer()
    configureStats()
    configureWeakness()
    configureAbilities()
    configureBreeding()
    configureCapture()
    configureSprites()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func setButtonHandler(handler: ((UIView) -> ())?) {
    
  }
  
  override func initConstraint() {
    contentVw.autoPinEdgesToSuperviewEdges()
    
    // Stats
    statsStackVw.autoPinEdge(toSuperviewEdge: .top)
    statsStackVw.autoPinEdge(toSuperviewEdge: .leading)
    statsStackVw.autoPinEdge(toSuperviewEdge: .trailing)
    
    // Weaknesses
    weaknessLbl.autoPinEdge(.top, to: .bottom, of: statsStackVw, withOffset: 24)
    weaknessLbl.autoAlignAxis(toSuperviewAxis: .vertical)
    weaknessCollectionVw.autoPinEdge(.top, to: .bottom, of: weaknessLbl, withOffset: 24)
    weaknessCollectionVw.autoPinEdge(toSuperviewEdge: .leading, withInset: 32)
    weaknessCollectionVw.autoPinEdge(toSuperviewEdge: .trailing, withInset: 32)
    
    // Abilities
    abilitiesLbl.autoPinEdge(.top, to: .bottom, of: weaknessCollectionVw, withOffset: 24)
    abilitiesLbl.autoAlignAxis(toSuperviewAxis: .vertical)
    
    abilityStackVw.autoPinEdge(.top, to: .bottom, of: abilitiesLbl, withOffset: 24)
    abilityStackVw.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
    abilityStackVw.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
    
    // Breeding
    breedingLbl.autoPinEdge(.top, to: .bottom, of: abilityStackVw, withOffset: 24)
    breedingLbl.autoAlignAxis(toSuperviewAxis: .vertical)
    
    breedingVw.autoPinEdge(.top, to: .bottom, of: breedingLbl, withOffset: 24)
    breedingVw.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
    breedingVw.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
    
    // Capture
    captureLbl.autoPinEdge(.top, to: .bottom, of: breedingVw, withOffset: 24)
    captureLbl.autoAlignAxis(toSuperviewAxis: .vertical)
    
    captureVw.autoPinEdge(.top, to: .bottom, of: captureLbl, withOffset: 24)
    captureVw.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
    captureVw.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
    
    // Spriters
    spritesLbl.autoPinEdge(.top, to: .bottom, of: captureVw, withOffset: 24)
    spritesLbl.autoAlignAxis(toSuperviewAxis: .vertical)
    
    spritesStackVw.autoPinEdge(.top, to: .bottom, of: spritesLbl, withOffset: 24)
    spritesStackVw.autoSetDimension(.height, toSize: 80)
    spritesStackVw.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
    spritesStackVw.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
    spritesStackVw.autoPinEdge(toSuperviewEdge: .bottom, withInset: 16)
    
    normalLbl.autoPinEdge(toSuperviewEdge: .top)
    normalLbl.autoAlignAxis(toSuperviewAxis: .vertical)
    
    normalImageVw.autoPinEdge(.top, to: .bottom, of: normalLbl, withOffset: 8)
    normalImageVw.autoSetDimensions(to: CGSize(width: 80, height: 80))
    normalImageVw.autoAlignAxis(.vertical, toSameAxisOf: normalLbl)
    
    shinyLbl.autoPinEdge(toSuperviewEdge: .top)
    shinyLbl.autoAlignAxis(toSuperviewAxis: .vertical)
    
    shinyImageVw.autoPinEdge(.top, to: .bottom, of: shinyLbl, withOffset: 8)
    shinyImageVw.autoSetDimensions(to: CGSize(width: 80, height: 80))
    shinyImageVw.autoAlignAxis(.vertical, toSameAxisOf: shinyLbl)
  }
  
  func configureContainer() {
    contentVw = UIView(frame: .zero)
    contentVw.backgroundColor = .white
    addSubview(contentVw)
  }
  
  func configureStats() {
    statsStackVw = UIStackView(frame: .zero)
    statsStackVw.distribution = .fill
    statsStackVw.alignment = .fill
    statsStackVw.axis = .vertical
    contentVw.addSubview(statsStackVw)
  }
  
  func configureWeakness() {
    weaknessLbl = UILabel(frame: .zero)
    weaknessLbl.textColor = UIColor(hex: "#63A8E1")
    weaknessLbl.text = "Weaknesses"
    weaknessLbl.textAlignment = .center
    weaknessLbl.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    contentVw.addSubview(weaknessLbl)
    
    let size = UIScreen.main.bounds.size
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: size.width / 4, height: 30)
    weaknessCollectionVw = UICollectionView(frame: .zero, collectionViewLayout: layout)
    weaknessCollectionVw.isScrollEnabled = false
    weaknessCollectionVw.backgroundColor = .white
    weaknessCollectionVw.register(WeaknessCollectionViewCell.self, forCellWithReuseIdentifier: WeaknessCollectionViewCell.identifier)
    contentVw.addSubview(weaknessCollectionVw)
  }
  
  func configureAbilities() {
    abilitiesLbl = UILabel(frame: .zero)
    abilitiesLbl.textColor = UIColor(hex: "#63A8E1")
    abilitiesLbl.text = "Abilities"
    abilitiesLbl.textAlignment = .center
    abilitiesLbl.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    contentVw.addSubview(abilitiesLbl)
    
    abilityStackVw = UIStackView(frame: .zero)
    abilityStackVw.distribution = .fill
    abilityStackVw.alignment = .fill
    abilityStackVw.axis = .vertical
    contentVw.addSubview(abilityStackVw)
  }
  
  func configureBreeding() {
    breedingLbl = UILabel(frame: .zero)
    breedingLbl.textColor = UIColor(hex: "#63A8E1")
    breedingLbl.text = "Breeding"
    breedingLbl.textAlignment = .center
    breedingLbl.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    contentVw.addSubview(breedingLbl)
    
    breedingVw = BreedingView(frame: .zero)
    contentVw.addSubview(breedingVw)
  }
  
  func configureCapture() {
    captureLbl = UILabel(frame: .zero)
    captureLbl.textColor = UIColor(hex: "#63A8E1")
    captureLbl.text = "Capture"
    captureLbl.textAlignment = .center
    captureLbl.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    contentVw.addSubview(captureLbl)
    
    captureVw = CaptureView(frame: .zero)
    captureVw.backgroundColor = .red
    contentVw.addSubview(captureVw)
  }
  
  func configureSprites() {
    spritesLbl = UILabel(frame: .zero)
    spritesLbl.textColor = UIColor(hex: "#63A8E1")
    spritesLbl.text = "Sprites"
    spritesLbl.textAlignment = .center
    spritesLbl.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    contentVw.addSubview(spritesLbl)
    
    spritesStackVw = UIStackView(frame: .zero)
    spritesStackVw.distribution = .fillEqually
    spritesStackVw.alignment = .fill
    spritesStackVw.axis = .horizontal

    contentVw.addSubview(spritesStackVw)
    
    containerNormalVw = UIView(frame: .zero)
    spritesStackVw.addArrangedSubview(containerNormalVw)
    
    normalLbl = UILabel(frame: .zero)
    normalLbl.textColor = UIColor(hex: "#63A8E1")
    normalLbl.text = "Normal"
    containerNormalVw.addSubview(normalLbl)
    
    normalImageVw = UIImageView(frame: .zero)
    normalImageVw.image = UIImage(named: "bug")
    containerNormalVw.addSubview(normalImageVw)
    
    containerShinyVw = UIView(frame: .zero)
    spritesStackVw.addArrangedSubview(containerShinyVw)
    
    shinyLbl = UILabel(frame: .zero)
    shinyLbl.textColor = UIColor(hex: "#63A8E1")
    shinyLbl.text = "Shiny"
    containerShinyVw.addSubview(shinyLbl)
    
    shinyImageVw = UIImageView(frame: .zero)
    shinyImageVw.image = UIImage(named: "bug")
    containerShinyVw.addSubview(shinyImageVw)
  }
}

// MARK: Helper
extension ContainerStatsView {
  func setAbilityStackVw(height: CGFloat) {
    abilityStackVw.autoSetDimension(.height, toSize: height)
  }
}
