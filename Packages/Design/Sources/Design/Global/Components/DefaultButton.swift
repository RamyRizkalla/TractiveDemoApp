//
//  DefaultButton.swift
//  Tractive Demo App
//
//  Created by Ramy Rizkalla on 19/07/2024.
//

import Foundation
import UIKit

/// A UIButton subclass that provides easier access to some properties.
@IBDesignable public final class DefaultButton: UIButton {
  @IBInspectable public var cornerRadius: CGFloat {
    set {
      layer.cornerRadius = newValue
    }
    get {
      return layer.cornerRadius
    }
  }

  /// The title color for the normal state.
  @IBInspectable public var normalTitleColor: UIColor {
    set {
      setTitleColor(newValue, for: .normal)
    }
    get {
      return titleLabel?.textColor ?? .white
    }
  }
}
