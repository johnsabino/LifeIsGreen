//
//  AboutLiveViewController.swift
//  LiveViewTestApp
//
//  Created by João Paulo de Oliveira Sabino on 23/03/19.
//

import Foundation

import UIKit
import PlaygroundSupport

public class AboutLiveViewController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    
    let photo = UIImageView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    let background = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    
    override public func viewDidLoad() {
        photo.image = UIImage(named: "photo")
        photo.contentMode = .scaleAspectFit
        background.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        
        view.addSubview(background)
        background.addSubview(photo)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        photo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            photo.widthAnchor.constraint(equalToConstant: 300),
            photo.heightAnchor.constraint(equalToConstant: 300)
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
