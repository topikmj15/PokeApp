//
//  UIView+Extension.swift
//  PokeApp
//
//  Created by Topik Mujianto on 23/08/21.
//

import UIKit

extension UIView {
  func addRightBorder(color: UIColor, width: CGFloat) {
    let border = CALayer()
    border.backgroundColor = color.cgColor
    border.frame = CGRect(x: frame.maxX, y: frame.minY, width: width, height: frame.height)
    self.layer.addSublayer(border)
  }
}
