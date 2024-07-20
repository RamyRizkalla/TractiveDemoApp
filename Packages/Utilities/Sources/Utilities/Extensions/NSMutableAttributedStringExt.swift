//
//  NSMutableAttributedStringExt.swift
//  Tractive Demo App
//
//  Created by Ramy Rizkalla on 19/07/2024.
//

import Foundation
import UIKit

public extension NSMutableAttributedString {
  var fontSize:CGFloat { return 14 }
  var boldFont:UIFont { .boldSystemFont(ofSize: fontSize) }
  var normalFont:UIFont { .systemFont(ofSize: fontSize)}

  func bold(_ value:String) -> NSMutableAttributedString {
    let attributes:[NSAttributedString.Key: Any] = [
      .font : boldFont
    ]

    self.append(NSAttributedString(string: value, attributes:attributes))
    return self
  }

  func normal(_ value:String) -> NSMutableAttributedString {

    let attributes:[NSAttributedString.Key : Any] = [
      .font : normalFont,
    ]

    self.append(NSAttributedString(string: value, attributes:attributes))
    return self
  }
}
