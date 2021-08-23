//
//  DetailsPageViewController.swift
//  PokeApp
//
//  Created by GMV on 21/08/21.
//

import UIKit

class DetailsPageViewController: BaseViewController {
  // MARK: Property
  private var detailsPageVw = DetailsPageView()
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.configColorBar(colorBar: [UIColor(hex: "#63A8E1"), UIColor(hex: "#77BFE1")], colorTitle: .white, colorBarButton: .white)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.configBackButton()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.configColorBar(colorBar: [], colorTitle: .white, colorBarButton: .white)
  }
  
  override func viewDidLoad() {
    configureView()
  }
  
  override func configureView() {
    detailsPageVw.instantiate(controller: self)
    detailsPageVw.setButtonHandler { button in
      if button == self.detailsPageVw.statsBtn {
        self.detailsPageVw.onSelectedTab()
      } else if button == self.detailsPageVw.evolutionBtn {
        self.detailsPageVw.onSelectedTab()
      }
    }
  }
}
