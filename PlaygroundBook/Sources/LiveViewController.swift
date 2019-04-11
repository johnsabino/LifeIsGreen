//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  An auxiliary source file which is part of the book-level auxiliary sources.
//  Provides the implementation of the "always-on" live view.
//

import UIKit
import PlaygroundSupport
import SpriteKit

@objc(Book_Sources_LiveViewController)
public class LiveViewController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    
    /*
    public func liveViewMessageConnectionOpened() {
        // Implement this method to be notified when the live view message connection is opened.
        // The connection will be opened when the process running Contents.swift starts running and listening for messages.
    }
    */

    var currentPage: Int = 3
    let scene = MyScene()
    override public func viewDidLoad() {
        let skView = SKView(frame: self.view.frame)

        scene.currentPage = self.currentPage
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        self.view.addSubview(skView)
        
    }

    /*
    public func liveViewMessageConnectionClosed() {
        // Implement this method to be notified when the live view message connection is closed.
        // The connection will be closed when the process running Contents.swift exits and is no longer listening for messages.
        // This happens when the user's code naturally finishes running, if the user presses Stop, or if there is a crash.
    }
    */

    public func receive(_ message: PlaygroundValue) {
        switch message {
        case .string("removeAllTrees"):
            if currentPage == 2 {
                scene.removeAllTrees()
            }
            
        case .string("resetGarbages"):
            if currentPage == 3 {
                scene.resetGarbage()
            }
            
        default:
            print("default")
        }
    }
}
