//
//  CaptureView.swift
//  PokeApp
//
//  Created by Topik Mujianto on 23/08/21.
//

import UIKit
import PureLayout
import ChameleonFramework

class CaptureView: BaseView {
  // MARK: Property
  /// Container
  var contentVw: UIView!
  
  var horizontalStackVw: UIStackView!
  var containerHabitatVw: UIView!
  var habitatLbl: UILabel!
  var habitatValueLbl: UILabel!
  
  var containerGenerationVw: UIView!
  var generationLbl: UILabel!
  var generationValueLbl: UILabel!
  
  var containerRateVw: UIView!
  var rateLbl: UILabel!
  var rateValueLbl: UILabel!
  
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
    horizontalStackVw.autoPinEdgesToSuperviewEdges(with: .zero)
    
    // Habitat
    habitatLbl.autoPinEdge(toSuperviewEdge: .top)
    habitatLbl.autoAlignAxis(toSuperviewAxis: .vertical)

    habitatValueLbl.autoPinEdge(.top, to: .bottom, of: habitatLbl, withOffset: 8)
    habitatValueLbl.autoAlignAxis(.vertical, toSameAxisOf: habitatLbl)
    habitatValueLbl.autoPinEdge(toSuperviewEdge: .bottom, withInset: 8)
    
    // Generation
    generationLbl.autoPinEdge(toSuperviewEdge: .top)
    generationLbl.autoAlignAxis(toSuperviewAxis: .vertical)

    generationValueLbl.autoPinEdge(.top, to: .bottom, of: generationLbl, withOffset: 8)
    generationValueLbl.autoAlignAxis(.vertical, toSameAxisOf: generationLbl)
    generationValueLbl.autoPinEdge(toSuperviewEdge: .bottom, withInset: 8)
    
    // Rate
    rateLbl.autoPinEdge(toSuperviewEdge: .top)
    rateLbl.autoAlignAxis(toSuperviewAxis: .vertical)

    rateValueLbl.autoPinEdge(.top, to: .bottom, of: rateLbl, withOffset: 8)
    rateValueLbl.autoAlignAxis(.vertical, toSameAxisOf: rateLbl)
    rateValueLbl.autoPinEdge(toSuperviewEdge: .bottom, withInset: 8)
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
    containerHabitatVw = UIView(frame: .zero)
    horizontalStackVw.addArrangedSubview(containerHabitatVw)
    
    habitatLbl = UILabel(frame: .zero)
    habitatLbl.textColor = UIColor(hex: "#63A8E1")
    habitatLbl.text = "Habitat"
    habitatLbl.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    containerHabitatVw.addSubview(habitatLbl)
    
    habitatValueLbl = UILabel(frame: .zero)
    habitatValueLbl.textColor = .black
    habitatValueLbl.font =  UIFont.systemFont(ofSize: 12, weight: .regular)
    containerHabitatVw.addSubview(habitatValueLbl)
    
    // Generation
    containerGenerationVw = UIView(frame: .zero)
    horizontalStackVw.addArrangedSubview(containerGenerationVw)
    
    generationLbl = UILabel(frame: .zero)
    generationLbl.textColor = UIColor(hex: "#63A8E1")
    generationLbl.text = "Generation"
    generationLbl.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    containerGenerationVw.addSubview(generationLbl)
    
    generationValueLbl = UILabel(frame: .zero)
    generationValueLbl.textColor = .black
    generationValueLbl.font =  UIFont.systemFont(ofSize: 12, weight: .regular)
    containerGenerationVw.addSubview(generationValueLbl)
    
    // Rate
    containerRateVw = UIView(frame: .zero)
    horizontalStackVw.addArrangedSubview(containerRateVw)
    
    rateLbl = UILabel(frame: .zero)
    rateLbl.textColor = UIColor(hex: "#63A8E1")
    rateLbl.text = "Capture Rate"
    rateLbl.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    containerRateVw.addSubview(rateLbl)
    
    rateValueLbl = UILabel(frame: .zero)
    rateValueLbl.textColor = .black
    rateValueLbl.font =  UIFont.systemFont(ofSize: 12, weight: .regular)
    containerRateVw.addSubview(rateValueLbl)
  }
}

