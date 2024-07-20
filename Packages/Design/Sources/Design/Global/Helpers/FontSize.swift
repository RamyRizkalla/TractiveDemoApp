//
//  File.swift
//  
//
//  Created by Ramy Rizkalla on 20/07/2024.
//

import Foundation

/// Represents different font types sizes.
public enum FontSize {
  case title

  var size: CGFloat {
    switch self {
    case .title:
      return 24
    }
  }
}
