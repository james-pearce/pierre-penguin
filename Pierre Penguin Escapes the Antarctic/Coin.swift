//
//  Coin.swift
//  Pierre Penguin Escapes the Antarctic
//
//  Created by James Pearce on 29/3/19.
//  Copyright © 2019 3 Crowns Consulting. All rights reserved.
//

import SpriteKit

class Coin: SKSpriteNode, GameSprite {
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "goods.atlas")
    // Store a default value for the bronze coin
    var value = 1
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize=CGSize(width: 26, height: 26)) {
        parentNode.addChild(self)
        self.size = size
        self.position = position
        self.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        self.physicsBody?.affectedByGravity = false
        self.texture = textureAtlas.textureNamed("coin-bronze.png")
    }
    
    // A function to transform this coin into gold!
    func turnToGold() {
        self.texture = textureAtlas.textureNamed("coin-gold.png")
        self.value = 5
    }
    
    func onTap() {
        
    }
}
