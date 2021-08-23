//
//  UIButton+Extension.swift
//  PokeApp
//
//  Created by Topik Mujianto on 22/08/21.
//

import UIKit

class CustomButton: UIButton {
  private var handlerTouchUpInside: ((UIView)->())?
  
  func addHandlerButton(handler: ((UIView)->())?) {
      handlerTouchUpInside = handler
      self.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
  }
  @objc private func touchUpInside() {
      self.handlerTouchUpInside?(self)
  }
}
