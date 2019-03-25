//
//  Player.swift
//  Pierre Penguin Escapes the Antarctic
//
//  Created by James Pearce on 23/3/19.
//  Copyright © 2019 3 Crowns Consulting. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode, GameSprite {
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "pierre.atlas")
    // Pierre has multiple animations
    // Right now we will create an animation for flying up and one for going down
    var flyAnimation = SKAction()
    var soarAnimation = SKAction()
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize=CGSize(width: 64, height: 64)) {
        parentNode.addChild(self)
        createAnimations()
        self.size = size
        self.position = position
        // if we run an action with a key, "flapAnimation", we can later reference
        // that key to remove the action.
        self.run(flyAnimation, withKey: "flapAnimation")
    }
    
    func createAnimations() {
        let rotateUpAction = SKAction.rotate(toAngle: 0, duration: 0.475)
        rotateUpAction.timingMode = .easeOut
        let rotateDownAction = SKAction.rotate(toAngle: -1, duration: 0.8)
        rotateDownAction.timingMode = .easeIn
        
        // create the flying animation
        let flyFrames:[SKTexture] = [
            textureAtlas.textureNamed("pierre-flying-1.png"),
            textureAtlas.textureNamed("pierre-flying-2.png"),
            textureAtlas.textureNamed("pierre-flying-3.png"),
            textureAtlas.textureNamed("pierre-flying-4.png"),
            textureAtlas.textureNamed("pierre-flying-3.png"),
            textureAtlas.textureNamed("pierre-flying-2.png")
        ]
        let flyAction = SKAction.animate(with: flyFrames, timePerFrame: 0.03)
        // group together the flying animation frames with a rotation up
        flyAnimation = SKAction.group([SKAction.repeatForever(flyAction),
                                       rotateUpAction])
        // create the soaring animation, just one frame for now
        let soarFrames:[SKTexture] = [textureAtlas.textureNamed("pierre-flying-1.png")]
        let soarAction = SKAction.animate(with: soarFrames, timePerFrame: 1)
        // group the soaring animation with the rotation down
        soarAnimation = SKAction.group([SKAction.repeatForever(soarAction), rotateDownAction])
        
    }
}
