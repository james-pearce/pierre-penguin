//
//  Bats.swift
//  Pierre Penguin Escapes the Antarctic
//
//  Created by James Pearce on 27/3/19.
//  Copyright © 2019 3 Crowns Consulting. All rights reserved.
//

import SpriteKit

class Bat: SKSpriteNode, GameSprite {
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "enemies.atlas")
    var flyAnimation = SKAction()
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize=CGSize(width: 44, height: 24)) {
        parentNode.addChild(self)
        createAnimations()
        self.size = size
        self.position = position
        self.run(flyAnimation)
        self.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        self.physicsBody?.affectedByGravity = false
    }
    
    func createAnimations() {
        // The bat has four animation textures
        let flyFrames:[SKTexture] = [
            textureAtlas.textureNamed("bat-fly-1.png"),
            textureAtlas.textureNamed("bat-fly-2.png"),
            textureAtlas.textureNamed("bat-fly-3.png"),
            textureAtlas.textureNamed("bat-fly-4.png")
        ]
        let flyAction = SKAction.animate(with: flyFrames, timePerFrame: 0.06)
        flyAnimation = SKAction.repeatForever(flyAction)
    }
    
    func onTap() {
        
    }
}
