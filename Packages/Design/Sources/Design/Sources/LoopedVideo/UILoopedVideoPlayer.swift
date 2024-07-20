//
//  UILoopedVideoPlayer.swift
//  Tractive Demo App
//
//  Created by Ramy Rizkalla on 19/07/2024.
//

import AVKit
import UIKit
import Utilities

/// A view for embedding local videos.
///
/// The view shows videos by passing its local file path. Then it automatically plays it, starting again from the beginning once the video ends
final public class UILoopedVideoPlayer: UIView, NibLoadable {
  @IBOutlet private var containerView: UIView!

  private var player: AVQueuePlayer?
  private var videoLooper: AVPlayerLooper?

  override init(frame: CGRect) {
    super.init(frame: frame)
    try? self.loadFromNib(bundle: .module)
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    try? self.loadFromNib(bundle: .module)
  }

  /// Initializes and plays the video.
  public func initialize(_ videoPath: String) {
    // convert the path string to a url
    let videoUrl = URL(fileURLWithPath: videoPath)

    let asset = AVAsset(url: videoUrl)
    let item = AVPlayerItem(asset: asset)

    self.player = AVQueuePlayer()

    // create a video layer for the player
    let layer = AVPlayerLayer(player: player).with {
      $0.frame = containerView.bounds
      $0.videoGravity = .resizeAspectFill
    }

    // add the layer to the container view
    containerView.layer.addSublayer(layer)

    videoLooper = AVPlayerLooper(player: self.player!, templateItem: item)
    self.player?.play()
  }
}
