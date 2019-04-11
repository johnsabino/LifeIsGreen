//
//  Sea.swift
//  Book_Sources
//
//  Created by João Paulo de Oliveira Sabino on 22/03/19.
//

import SpriteKit

public class Sea: SKNode {
    
    
    var seaClean = SKSpriteNode(imageNamed: "Beach_00015")
    var seaDirty = SKSpriteNode(imageNamed: "DirtyBeach_00015")
    
    override init() {
        super.init()
        seaDirty.zPosition = seaClean.zPosition + 1
        seaDirty.alpha = 0.6
        addChild(seaClean)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
