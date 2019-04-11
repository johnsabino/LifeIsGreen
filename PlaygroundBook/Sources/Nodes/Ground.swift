//
//  Ground.swift
//  LiveViewTestApp
//
//  Created by João Paulo de Oliveira Sabino on 21/03/19.
//

import SpriteKit

public class Ground: SKSpriteNode {
    var touchGround : ((_: CGPoint) -> Void)?
    
//    public override init(texture: SKTexture?, color: UIColor, size: CGSize) {
//        super.init(texture: texture, color: color, size: size)
//        isUserInteractionEnabled = true
//    }
//    
//    convenience init(imageNamed: String){
//        let texture = SKTexture(imageNamed: imageNamed)
//        self.init(texture: texture, color: .clear, size: texture.size())
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("begin")
    }
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ended")
        if let touch = touchGround {
            touch(touches.first!.location(in: self))
        }
    }
}
