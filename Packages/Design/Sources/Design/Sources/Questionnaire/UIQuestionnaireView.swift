//
//  UIQuestionnaireVie.swift
//  
//
//  Created by Ramy Rizkalla on 20/07/2024.
//

import UIKit

public class UIQuestionnaireView: UIView, NibLoadable {
  public enum MediaType {
    case video(String), image(UIImage)
  }

  @IBOutlet private var containerView: UIView!
  @IBOutlet private var titleLabel: UILabel!
  @IBOutlet private var subtitleLabel: UILabel!
  @IBOutlet private var topButton: DefaultButton!
  @IBOutlet private var bottomButton: DefaultButton!

  public override init(frame: CGRect) {
    super.init(frame: frame)
    try? loadFromNib(bundle: .module)
  }

  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    try? loadFromNib(bundle: .module)
  }

  public func setMedia(_ mediaType: MediaType) {
    switch mediaType {
    case let .video(videoPath):
      let loopedVideo = UILoopedVideoPlayer()
      containerView.addSubview(loopedVideo)
      loopedVideo.bindEdgesToSuperview()
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        loopedVideo.initialize(videoPath)
      }
    case let.image(image):
      let imageView = UIImageView()
      imageView.image = image
      imageView.contentMode = .scaleAspectFill
      imageView.clipsToBounds = true
      containerView.addSubview(imageView)
      imageView.bindEdgesToSuperview()
    }
  }

  public func setupTitleLabel(_ action: (UILabel) -> Void) {
    action(titleLabel)
  }

  public func setupsubtitleLabel(_ action: (UILabel) -> Void) {
    action(subtitleLabel)
  }

  public func setupTopButton(_ action: (DefaultButton) -> Void) {
    action(topButton)
  }

  public func setupBottomButton(_ action: (DefaultButton) -> Void) {
    action(bottomButton)
  }
}
