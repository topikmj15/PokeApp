//
//  UINavigationController+Extension.swift
//  PokeApp
//
//  Created by Topik Mujianto on 22/08/21.
//

import UIKit

extension UINavigationController {
  var statusBarHeight: CGFloat  {
    if #available(iOS 13.0, *) {
      let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
      return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    } else {
      return UIApplication.shared.statusBarFrame.height
    }
  }
  
  func configColorBar(colorBar: [UIColor], colorTitle: UIColor, colorBarButton: UIColor, alpha: CGFloat = 1, isTranslucent: Bool = false) {
    let heightStatusNavBar = statusBarHeight  + (self.navigationController?.navigationBar.frame.height ?? 0.0)
    navigationBar.isTranslucent = isTranslucent
    navigationBar.barTintColor = colorBar.count == 1 ? colorBar[0].withAlphaComponent(alpha) : UIColor(gradientStyle: .leftToRight, withFrame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: heightStatusNavBar), andColors: colorBar)?.withAlphaComponent(alpha)
    navigationBar.backgroundColor = colorBar.count == 1 ? colorBar[0].withAlphaComponent(alpha) : UIColor(gradientStyle: .leftToRight, withFrame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: heightStatusNavBar), andColors: colorBar)?.withAlphaComponent(alpha)
  }
  
  func configBackButton() {
    navigationBar.tintColor = UIColor.white
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
  }
  
  func addBlurEffect() {
    navigationBar.isTranslucent = true
    navigationBar.setBackgroundImage(UIImage(), for: .default)
    var blurFrame = navigationBar.bounds
    blurFrame.size.height += statusBarHeight
    blurFrame.origin.y -= statusBarHeight
    let blurView  = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    blurView.isUserInteractionEnabled = false
    blurView.frame = blurFrame
    blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    navigationBar.addSubview(blurView)
    blurView.layer.zPosition = -1
  }
}
