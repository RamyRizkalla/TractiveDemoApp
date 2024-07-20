//
//  File.swift
//  
//
//  Created by Ramy Rizkalla on 20/07/2024.
//

import Foundation
import UIKit

public extension UIFont {
  class func boldSystemFont(sizeType type: FontSize) -> UIFont {
    .boldSystemFont(ofSize: type.size)
  }
}
