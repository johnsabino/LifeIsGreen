//
//  Cloud.swift
//  LiveViewTestApp
//
//  Created by João Paulo de Oliveira Sabino on 22/03/19.
//

import SpriteKit

public class Cloud: SKNode {
    
    var alphaCloud: CGFloat = 0.5 {
        didSet{
            self.cloudDirty.alpha = alphaCloud
            self.cloudClean.alpha = 1 - alphaCloud
        }
    }
    
    var cloudClean = SKSpriteNode(imageNamed: "cloud")
    var cloudDirty = SKSpriteNode(imageNamed: "dirty_cloud")
    
    override init() {
        super.init()
        
        cloudDirty.alpha = alphaCloud
        cloudClean.alpha = 1 - alphaCloud
        addChild(cloudClean)
        addChild(cloudDirty)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
