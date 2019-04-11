//
//  Atlas.swift
//  Book_Sources
//
//  Created by João Paulo de Oliveira Sabino on 21/03/19.
//

import SpriteKit

class Atlas {
    public static func create(named: String) -> [SKTexture]{
        let animated = SKTextureAtlas(named: named)
        var frames : [SKTexture] = []
        for i in 0..<animated.textureNames.count{
            let texture = animated.textureNamed(animated.textureNames.sorted()[i])
            frames.append(texture)
        }
        return frames
    }
}
