//
//  Garbage.swift
//  Book_Sources
//
//  Created by João Paulo de Oliveira Sabino on 21/03/19.
//

import SpriteKit


public class Garbage: SKSpriteNode {
    var touchGarbage : ((_: Bool) -> Void)?
    var touchMoved: ((_: CGPoint) -> Void)?
    
    var type: TrashType = .paper
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(imageNamed: String, type: TrashType){
        self.init(imageNamed: imageNamed)
        self.type = type
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touchAction = touchGarbage {
            touchAction(true)
        }
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("moved")
        if let touchAction = touchMoved, let touch = touches.first, let selfParent = self.parent {
            touchAction(touch.location(in: selfParent))
        }
    }
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touchAction = touchGarbage {
            touchAction(false)
        }
    }
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touchAction = touchGarbage {
            touchAction(false)
        }
    }
}
