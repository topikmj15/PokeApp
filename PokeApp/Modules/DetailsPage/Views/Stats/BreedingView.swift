//
//  BreedingView.swift
//  PokeApp
//
//  Created by Topik Mujianto on 23/08/21.
//

import UIKit
import PureLayout
import ChameleonFramework

class BreedingView: BaseView {
  // MARK: Property
  /// Container
  var contentVw: UIView!
  
  var horizontalStackVw: UIStackView!
  var containerEggGroupVw: UIView!
  var eggGroupLbl: UILabel!
  var eggGroupValueLbl: UILabel!
  
  
  var containerHatcTimeVw: UIView!
  var hatcTimeLbl: UILabel!
  var hatcTimeStepLbl: UILabel!
  var hatcTimeCycleLbl: UILabel!
  
  var containerGenderVw: UIView!
  var genderLbl: UILabel!
  var genderStepLbl: UILabel!
  var genderCycleLbl: UILabel!
  
  // MARK: Function
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureContainer()
    configureContent()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func initConstraint() {
    contentVw.autoPinEdgesToSuperviewEdges(with: .zero)
    horizontalStackVw.autoPinEdgesToSuperviewEdges(with: .zero)
    
    // Habitat
    eggGroupLbl.autoPinEdge(toSuperviewEdge: .top)
    eggGroupLbl.autoAlignAxis(toSuperviewAxis: .vertical)

    eggGroupValueLbl.autoPinEdge(.top, to: .bottom, of: eggGroupLbl, withOffset: 8)
    eggGroupValueLbl.autoAlignAxis(.vertical, toSameAxisOf: eggGroupLbl)
    
    // Generation
    hatcTimeLbl.autoPinEdge(toSuperviewEdge: .top)
    hatcTimeLbl.autoAlignAxis(toSuperviewAxis: .vertical)

    hatcTimeStepLbl.autoPinEdge(.top, to: .bottom, of: hatcTimeLbl, withOffset: 8)
    hatcTimeStepLbl.autoAlignAxis(.vertical, toSameAxisOf: hatcTimeLbl)
    
    hatcTimeCycleLbl.autoPinEdge(.top, to: .bottom, of: hatcTimeStepLbl, withOffset: 8)
    hatcTimeCycleLbl.autoAlignAxis(.vertical, toSameAxisOf: hatcTimeStepLbl)
    hatcTimeCycleLbl.autoPinEdge(toSuperviewEdge: .bottom, withInset: 8)
    
    // Rate
    genderLbl.autoPinEdge(toSuperviewEdge: .top)
    genderLbl.autoAlignAxis(toSuperviewAxis: .vertical)

    genderStepLbl.autoPinEdge(.top, to: .bottom, of: genderLbl, withOffset: 8)
    genderStepLbl.autoAlignAxis(.vertical, toSameAxisOf: genderLbl)
    
    genderCycleLbl.autoPinEdge(.top, to: .bottom, of: genderStepLbl, withOffset: 8)
    genderCycleLbl.autoAlignAxis(.vertical, toSameAxisOf: genderStepLbl)
    genderCycleLbl.autoPinEdge(toSuperviewEdge: .bottom, withInset: 8)
  }
  
  func configureContainer() {
    contentVw = UIView(frame: .zero)
    contentVw.backgroundColor = .white
    addSubview(contentVw)
  }
  
  func configureContent() {
    horizontalStackVw = UIStackView(frame: .zero)
    horizontalStackVw.alignment = .leading
    horizontalStackVw.distribution = .fillEqually
    horizontalStackVw.spacing = 8
    horizontalStackVw.axis = .horizontal
    contentVw.addSubview(horizontalStackVw)
    
    // Habitat
    containerEggGroupVw = UIView(frame: .zero)
    horizontalStackVw.addArrangedSubview(containerEggGroupVw)
    
    eggGroupLbl = UILabel(frame: .zero)
    eggGroupLbl.textColor = UIColor(hex: "#63A8E1")
    eggGroupLbl.text = "Egg Group"
    eggGroupLbl.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    containerEggGroupVw.addSubview(eggGroupLbl)
    
    eggGroupValueLbl = UILabel(frame: .zero)
    eggGroupValueLbl.textColor = .black
    eggGroupValueLbl.numberOfLines = 0
    eggGroupValueLbl.textAlignment = .center
    eggGroupValueLbl.font =  UIFont.systemFont(ofSize: 12, weight: .regular)
    containerEggGroupVw.addSubview(eggGroupValueLbl)
    
    // Generation
    containerHatcTimeVw = UIView(frame: .zero)
    horizontalStackVw.addArrangedSubview(containerHatcTimeVw)
    
    hatcTimeLbl = UILabel(frame: .zero)
    hatcTimeLbl.textColor = UIColor(hex: "#63A8E1")
    hatcTimeLbl.text = "Hatch Time"
    hatcTimeLbl.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    containerHatcTimeVw.addSubview(hatcTimeLbl)
    
    hatcTimeStepLbl = UILabel(frame: .zero)
    hatcTimeStepLbl.textColor = .black
    hatcTimeStepLbl.text = "Habitat"
    hatcTimeStepLbl.font =  UIFont.systemFont(ofSize: 12, weight: .regular)
    containerHatcTimeVw.addSubview(hatcTimeStepLbl)
    
    hatcTimeCycleLbl = UILabel(frame: .zero)
    hatcTimeCycleLbl.textColor = .black
    hatcTimeCycleLbl.text = "Habitat"
    hatcTimeCycleLbl.font =  UIFont.systemFont(ofSize: 12, weight: .regular)
    containerHatcTimeVw.addSubview(hatcTimeCycleLbl)
    
    // Rate
    containerGenderVw = UIView(frame: .zero)
    horizontalStackVw.addArrangedSubview(containerGenderVw)
    
    genderLbl = UILabel(frame: .zero)
    genderLbl.textColor = UIColor(hex: "#63A8E1")
    genderLbl.text = "Capture Rate"
    genderLbl.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    containerGenderVw.addSubview(genderLbl)
    
    genderStepLbl = UILabel(frame: .zero)
    genderStepLbl.textColor = .black
    genderStepLbl.font =  UIFont.systemFont(ofSize: 12, weight: .regular)
    containerGenderVw.addSubview(genderStepLbl)
    
    genderCycleLbl = UILabel(frame: .zero)
    genderCycleLbl.textColor = .black
    genderCycleLbl.font =  UIFont.systemFont(ofSize: 12, weight: .regular)
    containerHatcTimeVw.addSubview(genderCycleLbl)
  }
}

