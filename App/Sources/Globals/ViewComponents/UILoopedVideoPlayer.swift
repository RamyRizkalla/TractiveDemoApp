//
//  UILoopedVideoPlayer.swift
//  Tractive Demo App
//
//  Created by Ramy Rizkalla on 19/07/2024.
//

import AVKit
import UIKit

class UILoopedVideoPlayer: UIView, NibLoadable {
  @IBOutlet private var containerView: UIView!

  private var player: AVQueuePlayer?
  private var videoLooper: AVPlayerLooper?

  override init(frame: CGRect) {
    super.init(frame: frame)
    try? self.loadFromNib(bundle: .main)
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    try? self.loadFromNib(bundle: .main)
  }

  func initialize(_ videoPath: String) {
    // convert the path string to a url
    let videoUrl = URL(fileURLWithPath: videoPath)

    let asset = AVAsset(url: videoUrl)
    let item = AVPlayerItem(asset: asset)

    // initialize the video player with the url
    self.player = AVQueuePlayer()

    // create a video layer for the player
    let layer: AVPlayerLayer = AVPlayerLayer(player: player)

    // make the layer the same size as the container view
    layer.frame = containerView.bounds

    // make the video fill the layer as much as possible while keeping its aspect size
    layer.videoGravity = .resizeAspectFill

    // add the layer to the container view
    containerView.layer.addSublayer(layer)

    videoLooper = AVPlayerLooper(player: self.player!, templateItem: item)
    self.player?.play()
  }
}

public enum NibLoadableError: Error {
    case xibNotFound
    case xibHasNoViews
    case xibHasMultipleRootViews
}

public protocol NibLoadable: AnyObject {
    static var nibName: String { get }

    func nibDidLoad()
}

extension NibLoadable where Self: UIView {
    /// The name of the nib file. Defaults to the same name as the class.
    public static var nibName: String {
        String(describing: self)
    }

    /// Loads the contents of this view from the corresponding Nib file.
    ///
    /// NOTE: This view must be the 'File's Owner', not the 'View' within the Nib file.
    public func loadFromNib(bundle: Bundle) throws {
        let nibName = Self.nibName
        let nib = UINib(nibName: nibName, bundle: bundle)

        guard let views = nib.instantiate(withOwner: self, options: nil) as? [UIView] else {
            throw NibLoadableError.xibNotFound
        }

        guard !views.isEmpty else {
            throw NibLoadableError.xibHasNoViews
        }

        guard views.count <= 1 else {
            throw NibLoadableError.xibHasMultipleRootViews
        }

        let viewFromNib = views[0]
        addSubview(viewFromNib)
        viewFromNib.bindEdgesToSuperview()

        nibDidLoad()
    }

    /// An empty implementation of nibDidLoad so subclasses don't necessarily need to override it.
    public func nibDidLoad() { /* no-op */ }
}

extension UIView {
  public func bindEdgesToSuperview(insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
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
