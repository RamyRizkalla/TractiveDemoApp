//
//  File.swift
//  
//
//  Created by Ramy Rizkalla on 20/07/2024.
//

import Foundation
import UIKit

public extension UIView {
  func bindEdgesToSuperview(insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
       guard let superview = superview else {
           preconditionFailure("`superview` was nil – call `addSubview(view: UIView)` before calling `bindEdgesToSuperview()` to fix this.")
       }

       translatesAutoresizingMaskIntoConstraints = false
       ["H:|-(\(insets.left))-[subview]-(\(insets.right))-|", "V:|-(\(insets.top))-[subview]-(\(insets.bottom))-|"].forEach { visualFormat in
           superview.addConstraints(
               NSLayoutConstraint.constraints(
                   withVisualFormat: visualFormat,
                   options: .directionLeadingToTrailing,
                   metrics: nil,
                   views: ["subview": self]
               )
           )
       }
   }
}
