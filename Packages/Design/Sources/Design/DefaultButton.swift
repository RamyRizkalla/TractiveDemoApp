//
//  DefaultButton.swift
//  Tractive Demo App
//
//  Created by Ramy Rizkalla on 19/07/2024.
//

import Foundation
import UIKit

@IBDesignable public final class DefaultButton: UIButton {
  @IBInspectable var cornerRadius: CGFloat {
    set {
      layer.cornerRadius = newValue
    }
    get {
      return layer.cornerRadius
    }
  }

  @IBInspectable var normalTitleColor: UIColor {
    set {
      setTitleColor(newValue, for: .normal)
    }
    get {
      return currentTitleColor
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}
