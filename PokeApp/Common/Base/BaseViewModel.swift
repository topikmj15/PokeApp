//
//  BaseViewModel.swift
//  PokeApp
//
//  Created by Topik Mujianto on 20/08/21.
//

import Foundation

class BaseViewModel {
    var loadError = Observable<String>()
    var loadData = Observable<Bool>()
    
    func dataSource(_ isForcedUpdate: Bool = false) -> DataSource {
        if isForcedUpdate {
            return DataSource.latest
        }
        
        return DataSource.current
    }
}
