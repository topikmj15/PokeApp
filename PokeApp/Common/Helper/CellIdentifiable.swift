//
//  CellIdentifiable.swift
//  PokeApp
//
//  Created by Topik Mujianto on 21/08/21.
//

import UIKit

protocol CellIdentifiable {
    static var nib: UINib { get }
    static var identifier: String { get }
}

extension CellIdentifiable {
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    static var identifier: String {
        return String(describing: self)
    }
}
