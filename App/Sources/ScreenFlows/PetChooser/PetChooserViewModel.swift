//
//  PetChooserViewModel.swift
//  Tractive Demo App
//
//  Created by Ramy Rizkalla on 19/07/2024.
//

import Foundation

final class PetChooserViewModel {
  let title: String = L10n.PetChooser.title

  var videoPath: String? {
    Bundle.main.path(forResource: "PetVideo", ofType: "mp4")
  }
}
