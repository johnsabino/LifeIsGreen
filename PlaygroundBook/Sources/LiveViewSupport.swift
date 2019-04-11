//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Provides supporting functions for setting up a live view.
//

import UIKit
import PlaygroundSupport

/// Instantiates a new instance of a live view.
///
/// By default, this loads an instance of `LiveViewController` from `LiveView.storyboard`.
public func instantiateLiveView() -> PlaygroundLiveViewable {
    let liveViewController = LiveViewController()
    return liveViewController
}

public func instantiateView(currentPage: Int) -> PlaygroundLiveViewable {
    let liveViewController = LiveViewController()
    liveViewController.currentPage = currentPage
    return liveViewController
}

public func instantiateIntroView() -> PlaygroundLiveViewable {
    let liveViewController = IntroLiveViewController()
    return liveViewController
}

public func instantiateAboutView() -> PlaygroundLiveViewable {
    let liveViewController = AboutLiveViewController()
    return liveViewController
}

public func removeAllTrees(){
    let liveView = PlaygroundPage.current.liveView as! PlaygroundRemoteLiveViewProxy
    liveView.send(.string("removeAllTrees"))
}

public func resetGarbages(){
    let liveView = PlaygroundPage.current.liveView as! PlaygroundRemoteLiveViewProxy
    liveView.send(.string("resetGarbages"))
}
