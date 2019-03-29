//
//  Blade.swift
//  Pierre Penguin Escapes the Antarctic
//
//  Created by James Pearce on 29/3/19.
//  Copyright © 2019 3 Crowns Consulting. All rights reserved.
//

import SpriteKit

class Blade: SKSpriteNode, GameSprite {
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "enemies.atlas")
    var spinAnimation = SKAction()
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize=CGSize(width: 185, height: 92)) {
        parentNode.addChild(self)
        self.size = size
        self.position = position
        // Create a physics body shaped by the blade texture
        self.physicsBody = SKPhysicsBody(texture: textureAtlas.textureNamed("blade-1.png"), size: size)
        self.physicsBody?.affectedByGravity = false
        // No dynamic body for the blade, which never moves
        self.physicsBody?.isDynamic = false
        createAnimations()
        self.run(spinAnimation)
    }
    
    func createAnimations() {
        let spinFrames:[SKTexture] = [
            textureAtlas.textureNamed("blade-1.png"),
            textureAtlas.textureNamed("blade-2.png")
        ]
        let spinAction = SKAction.animate(with: spinFrames, timePerFrame: 0.07)
        spinAnimation = SKAction.repeatForever(spinAction)
    }
    
    func onTap() {
        
    }
}
