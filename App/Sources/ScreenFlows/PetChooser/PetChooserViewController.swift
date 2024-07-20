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
  @IBOutlet private var videoViewContainer: UILoopedVideoPlayer!
  @IBOutlet private var titleLabel: UILabel!
  @IBOutlet private var subtitleLabel: UILabel!

  var player: AVQueuePlayer?
  var videoLooper: AVPlayerLooper?

  @IBAction private func didPressCatParent(_ sender: DefaultButton) {
  }

  @IBAction private func didPressDogParent(_ sender: DefaultButton) {
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.initializeVideoPlayerWithVideo()
  }

  private func setupView() {
    setupTitleLabel()
    setupsubtitleLabel()
  }

  private func setupTitleLabel() {
    titleLabel.text = L10n.PetChooser.title
    titleLabel.font = .boldSystemFont(ofSize: 24)
    titleLabel.textColor = .tintColor
  }

  private func setupsubtitleLabel() {
    subtitleLabel.attributedText = NSMutableAttributedString()
      .normal(L10n.PetChooser.Subtitle.expectation + " ")
      .bold(L10n.PetChooser.Subtitle.question)
    titleLabel.textColor = .tintColor
  }

  func initializeVideoPlayerWithVideo() {
    if let videoString = Bundle.main.path(forResource: "PetVideo", ofType: "mp4") {
      videoViewContainer.initialize(videoString)
    }
  }
}
