//
//  Bee.swift
//  Pierre Penguin Escapes the Antarctic
//
//  Created by James Pearce on 23/3/19.
//  Copyright © 2019 3 Crowns Consulting. All rights reserved.
//

import SpriteKit

// create the new class Bee, inheriting from SKSpriteNode and adopting the
// GameSprite protocol:
class Bee: SKSpriteNode, GameSprite {
    // we will store our texture atlas and bee animations as class-wide properties
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "bee.atlas")
    var flyAnimation = SKAction()
    
    // the spawn function will be used to place the beed into the world. Note how
    // we set a default value for the size parameter, since we already know the
    // size of a bee
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize=CGSize(width: 28, height: 24)) {
        parentNode.addChild(self)
        createAnimations()
        self.size = size
        self.position = position
        self.run(flyAnimation)
    }
    
    // our bee implements only one texture-based animation.
    // But some classes may be more complicated,
    // So we break out the animation-building into this function:
    func createAnimations(){
        let flyFrames:[SKTexture] = [textureAtlas.textureNamed("bee@2x.png"),
                                     textureAtlas.textureNamed("bee-fly@2x.png")]
        let flyAction = SKAction.animate(with: flyFrames, timePerFrame: 0.14)
        flyAnimation = SKAction.repeatForever(flyAction)
    }
    
    // onTap is not wired up yet, but we have to implement this function to
    // adhere to our protocol
    // we will explore touch events in the next chapter
    func onTap(){}
}
