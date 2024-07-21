//
//  CatChoiceViewController.swift
//  Tractive Demo App
//
//  Created by Ramy Rizkalla on 20/07/2024.
//

import Design
import UIKit

class CatChoiceViewController: UIViewController {
  @IBOutlet private var videoViewContainer: UIQuestionnaireView!

  private let viewModel: CatChoiceViewModel = .init()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    navigationController?.navigationBar.tintColor = .white
  }

  private func setupView() {
    setupMedia()
    setupTitleLabel()
    setupsubtitleLabel()
    setupTopButton()
    setupBottomButton()
  }

  private func setupTitleLabel() {
    videoViewContainer.setupTitleLabel { titleLabel in
      titleLabel.text = viewModel.title
      titleLabel.font = .boldSystemFont(ofSize: 24)
      titleLabel.textColor = .tintColor
    }
  }

  private func setupsubtitleLabel() {
    videoViewContainer.setupsubtitleLabel { subtitleLabel in
      subtitleLabel.text = viewModel.subtitle
    }
  }

  private func setupTopButton() {
    videoViewContainer.setupTopButton { topButton in
      topButton.setTitle(L10n.Global.Titles.no, for: .normal)
      topButton.backgroundColor = Asset.Colors.whitishGray.color
      topButton.normalTitleColor = .black
    }
  }

  private func setupBottomButton() {
    videoViewContainer.setupBottomButton { bottomButton in
      bottomButton.setTitle(L10n.Global.Titles.yes, for: .normal)
    }
  }

  private func setupMedia() {
    videoViewContainer.setMedia(.image(Asset.Images.catImage.image))
  }
}
