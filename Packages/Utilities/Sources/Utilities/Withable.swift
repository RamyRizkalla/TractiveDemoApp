//
//  File.swift
//  
//
//  Created by Ramy Rizkalla on 20/07/2024.
//

import Foundation

public protocol Withable {
  init()
}

public extension Withable {
  /// Construct a new instance, setting an arbitrary subset of properties
  init(with config: (inout Self) -> Void) {
    self.init()
    config(&self)
  }

  /// Create a copy, overriding an arbitrary subset of properties
  func with(_ config: (inout Self) -> Void) -> Self {
    var copy = self
    config(&copy)
    return copy
  }
}
