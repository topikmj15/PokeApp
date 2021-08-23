//
//  Navigation.swift
//  PokeApp
//
//  Created by Topik Mujianto on 21/08/21.
//

import UIKit

struct Navigation {
  // MARK: MainMenu
  static func initMainMenu()-> UIViewController {
    let vc = MainMenuViewController()
    let nav = UINavigationController(rootViewController: vc)
    return nav
  }
  
  // MARK: DetailsPage
  static func toDetailsPage(from uiViewController: UIViewController, data: [String: Any?]) {
    let vc = DetailsPageViewController()
    vc.configureData(data: data)
    uiViewController.navigationController?.pushViewController(vc, animated: true)
  }
}

