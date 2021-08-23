//
//  Observable.swift
//  PokeApp
//
//  Created by Topik Mujianto on 21/08/21.
//

import Foundation

class Observable<T: Decodable> {
  private let thread : DispatchQueue
  public var property : T? {
    willSet(newValue) {
      if let newValue = newValue {
        thread.async {
          self.observe?(newValue)
        }
      }
    }
  }
  public var observe : ((T) -> ())?
  public init(_ value: T? = nil, thread dispatcherThread: DispatchQueue =     DispatchQueue.main) {
    self.thread = dispatcherThread
    self.property = value
  }
}
