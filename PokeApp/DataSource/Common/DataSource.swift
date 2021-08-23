//
//  ApiDataSource.swift
//  PokeApp
//
//  Created by GMV on 20/08/21.
//

import Foundation

struct DataSource {
    static let latest = DataSource()
    static let 
    private var isForcedUpdate: Bool
    
    init(_ isForcedUpdate: Bool = true) {
        self.isForcedUpdate = isForcedUpdate
    }
    
    static func doGetPokemonList() {
        
    }
}
