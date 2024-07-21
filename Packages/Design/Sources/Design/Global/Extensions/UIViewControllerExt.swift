//
//  File.swift
//  
//
//  Created by Ramy Rizkalla on 20/07/2024.
//

import Foundation
import UIKit

public extension UIViewController {
  func showAlert(
    title: String? = nil,
    message: String
  ) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert).with {
      $0.addAction(.init(title: "Ok", style: .default))
    }
    present(alert, animated: true)
  }
}
