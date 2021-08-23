//
//  UIHelper.swift
//  PokeApp
//
//  Created by Topik Mujianto on 21/08/21.
//

import UIKit
import JGProgressHUD
import SwiftMessages

class UIHelper {
  // MARK: Property
  private static var loadingVw: JGProgressHUD?
  enum MessageOptionKey {
    case interface
    case backgroundColor
    case textColor
    case layout
    case style
  }
  
  // MARK: Function
  static func showLoading(view: UIView, isLoading: Bool) {
    if isLoading {
      loadingVw?.dismiss()
      loadingVw = nil
      loadingVw = JGProgressHUD()
      loadingVw?.style = .dark
      loadingVw?.show(in: view, animated: true)
    } else {
      loadingVw?.dismiss()
      loadingVw = nil
    }
  }
  
  static func showMessage(icon: String? = nil, title: String? = nil, body: String?, state: Bool = true, option: [MessageOptionKey: Any]) {
    let layout = option[.layout] as? MessageView.Layout ?? .messageView
    let style = option[.style] as? SwiftMessages.PresentationStyle ?? .bottom
    var backgroundColor = option[.backgroundColor] as? UIColor ?? .darkGray
    var textColor = option[.textColor] as? UIColor ?? .white
    if #available(iOS 12.0, *), let interfaceStyle = option[.interface] as? UIUserInterfaceStyle {
      backgroundColor = option[.backgroundColor] as? UIColor ?? (interfaceStyle == .light ? .darkGray : .white)
      textColor = option[.textColor] as? UIColor ?? (interfaceStyle == .light ? .white : .darkGray)
    }
    
    let messageView = MessageView.viewFromNib(layout: layout)
    messageView.configureContent(title: title, body: body, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "", buttonTapHandler: { _ in SwiftMessages.hide() })
    let image = UIImage(named:  icon ?? "")
    messageView.configureTheme(backgroundColor: backgroundColor, foregroundColor: textColor, iconImage: image, iconText: "")
    // Component
    messageView.button?.isHidden = true
    messageView.titleLabel?.isHidden = title?.isEmpty ?? false
    // Config
    var config = SwiftMessages.defaultConfig
    config.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
    config.duration = .seconds(seconds: 5)
    config.preferredStatusBarStyle = .lightContent
    config.presentationStyle = style
    // Show and Hide
    if state {
      SwiftMessages.show(config: config, view: messageView)
    } else {
      SwiftMessages.hide()
    }
  }
}
