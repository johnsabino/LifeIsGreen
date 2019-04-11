//
//  Trash.swift
//  LiveViewTestApp
//
//  Created by João Paulo de Oliveira Sabino on 23/03/19.
//

import SpriteKit

class Trash: SKSpriteNode {
    
    var trashArea = SKSpriteNode(texture: nil, color: .clear, size: CGSize(width: 420, height: 450))
    var type: TrashType = .paper
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(imageNamed: String, type: TrashType){
        self.init(imageNamed: imageNamed)
        self.type = type
        addChild(trashArea)
        
        trashArea.position = CGPoint(x: trashArea.position.x + 40, y: trashArea.position.y - 200)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum TrashType {
    case paper
    case organic
    case plastic
    case metal
}
