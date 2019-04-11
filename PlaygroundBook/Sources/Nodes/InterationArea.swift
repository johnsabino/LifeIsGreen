//
//  InterationArea.swift
//  Book_Sources
//
//  Created by João Paulo de Oliveira Sabino on 22/03/19.
//

import SpriteKit

public class InterationArea: SKShapeNode {
    var touchArea : ((_: CGPoint) -> Void)?
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touchAction = touchArea, let touch = touches.first, let selfParent = self.parent as? SKScene {
            let location = touch.location(in: selfParent)
            if selfParent.physicsWorld.body(at: location)?.node is InterationArea {
                touchAction(location)
            }
        }
    }
    
    func setupShape(){
        self.fillColor = .clear
        self.strokeColor = .clear
        self.zPosition = 30
        self.isUserInteractionEnabled = true
        
        self.physicsBody = SKPhysicsBody(polygonFrom: self.path!)
        self.physicsBody?.isDynamic = false
        
        
    }
}
