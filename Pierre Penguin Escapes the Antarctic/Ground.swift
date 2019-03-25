//
//  Ground.swift
//  Pierre Penguin Escapes the Antarctic
//
//  Created by James Pearce on 23/3/19.
//  Copyright © 2019 3 Crowns Consulting. All rights reserved.
//

import SpriteKit

// A new class, inheriting from SKSpriteNode and adkering to the GameSprite protocol.
class Ground: SKSpriteNode, GameSprite {
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "ground.atlas")
    // create an optional property named groundTexture to store the current
    // ground texture
    var groundTexture:SKTexture?
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize) {
        parentNode.addChild(self)
        self.size = size
        self.position = position
        // this is one of those unique situations where we use non-default
        // anchor point. By positioning the ground by its top left corner, we
        // can place it just slightly above the bottome of the screen on
        // any screen size
        
        self.anchorPoint = CGPoint(x: 0, y: 1) // CGPointMake
        // default to make the ice texture:
        if groundTexture == nil {
            groundTexture = textureAtlas.textureNamed("ice-tile.png")
        }
        
        // we will create child nodes to repeat the texture.
        createChildren()
    }
    
    // build child nodes to repeat the ground texture
    func createChildren(){
        // first make sure we have a groundTexture value
        if let texture = groundTexture {
            var tileCount:CGFloat = 0
            let textureSize = texture.size()
            // we will size the tiles at half the size of their texture for
            // retina sharpness
            let tileSize = CGSize(width: textureSize.width / 2, height: textureSize.height / 2)
            // build nodes until we cover the entire ground width
            while tileCount*tileSize.width < self.size.width {
                let tileNode = SKSpriteNode(texture: texture)
                tileNode.size = tileSize
                tileNode.position.x = tileCount*tileSize.width
                // position child nodes by their upper left corner
                tileNode.anchorPoint = CGPoint(x: 0, y: 1)
                // add the child texture to the ground node
                self.addChild(tileNode)
                tileCount += 1
            }
        }
    }
    
    func onTap() {}
}
