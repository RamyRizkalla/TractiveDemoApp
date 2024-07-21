//
//  PetChooserViewController.swift
//  Tractive Demo App
//
//  Created by Ramy Rizkalla on 19/07/2024.
//

import AVKit
import Design
import UIKit
import Utilities

class PetChooserViewController: UIViewController {
  @IBOutlet private var videoViewContainer: UIQuestionnaireView!

  private let viewModel: PetChooserViewModel = .init()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    initializeVideoPlayerWithVideo()
  }

  private func setupView() {
    setupTitleLabel()
    setupsubtitleLabel()
    setupTopButton()
    setupBottomButton()
  }

  private func setupTitleLabel() {
    videoViewContainer.setupTitleLabel { titleLabel in
      titleLabel.text = viewModel.title
      titleLabel.font = .boldSystemFont(sizeType: .title)
      titleLabel.textColor = .tintColor
      titleLabel.accessibilityIdentifier = "petChooser.titleLabel"
    }
  }

  private func setupsubtitleLabel() {
    videoViewContainer.setupsubtitleLabel { subtitleLabel in
      subtitleLabel.attributedText = NSMutableAttributedString()
        .normal(L10n.PetChooser.Subtitle.expectation + " ")
        .bold(L10n.PetChooser.Subtitle.question)
      subtitleLabel.accessibilityIdentifier = "petChooser.subTitleLabel"
    }
  }

  private func setupTopButton() {
    videoViewContainer.setupTopButton { topButton in
      topButton.setTitle(L10n.PetChooser.catParent, for: .normal)

      let action = UIAction { _ in
        let viewCtrl = StoryboardScene.CatChoice.catChoiceViewController.instantiate()
        self.navigationController?.pushViewController(viewCtrl, animated: true)
      }
      topButton.addAction(action, for: .touchUpInside)
    }
  }

  private func setupBottomButton() {
    videoViewContainer.setupBottomButton { bottomButton in
      bottomButton.setTitle(L10n.PetChooser.dogParent, for: .normal)
      // TODO: Add navigation logic to the bottom button.
      let action = UIAction { _ in
        self.showAlert(message: "To be implemented")
      }
      bottomButton.addAction(action, for: .touchUpInside)
    }
  }

  private func initializeVideoPlayerWithVideo() {
    if let videoString = viewModel.videoPath {
      videoViewContainer.setMedia(.video(videoString))
    }
  }
}
