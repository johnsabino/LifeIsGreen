//
//  IntroLiveViewController.swift
//  Book_Sources
//
//  Created by João Paulo de Oliveira Sabino on 23/03/19.
//

import Foundation

import UIKit
import PlaygroundSupport

public class IntroLiveViewController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {

    let logo = UIImageView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    let background = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    
    override public func viewDidLoad() {
        logo.image = UIImage(named: "logo")
        logo.contentMode = .scaleAspectFit
        background.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        
        view.addSubview(background)
        background.addSubview(logo)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logo.widthAnchor.constraint(equalToConstant: 300),
            logo.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    /*
     public func liveViewMessageConnectionClosed() {
     // Implement this method to be notified when the live view message connection is closed.
     // The connection will be closed when the process running Contents.swift exits and is no longer listening for messages.
     // This happens when the user's code naturally finishes running, if the user presses Stop, or if there is a crash.
     }
     */
    
}
