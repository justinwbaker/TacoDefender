//
//  Projectile.swift
//  TacoDefender
//
//  Created by Justin Baker, Cody Cormeir, and Ben Hancock on 2018-06-20.
//  Copyright © 2018 Justin Baker, Cody Cormeir, and Ben Hancock . All rights reserved.
//

import Foundation
import SpriteKit

class Projectile: SKSpriteNode {
    
    init(type: Tower.towerType, direction: CGFloat, position: CGPoint){
        var texture = SKTexture(imageNamed: "ketchup")
        var textureSize: CGSize = texture.size()
        switch type{
        
        case.ketchup:
            texture = SKTexture(imageNamed: "ketchup")
            textureSize = (texture.size() / 8)
            
        case.mustard:
            texture = SKTexture(imageNamed: "mustard")
            textureSize = (texture.size() / 8)

            
        case.guacamole:
            texture = SKTexture(imageNamed: "guacamole")
            textureSize = (texture.size() / 8)

        case.limeJuice:
            texture = SKTexture(imageNamed: "limeJuice")
            textureSize = (texture.size() / 8)

        case.sourCream:
            texture = SKTexture(imageNamed: "sourCream")
            textureSize = (texture.size() / 8)

        case.sriracha:
            texture = SKTexture(imageNamed: "sriracha")
            textureSize = (texture.size() / 8)

        case.chili:
            texture = SKTexture(imageNamed: "chili")
            textureSize = (texture.size() / 8)

        case .tartarSauce:
            texture = SKTexture(imageNamed: "tartarSauce")
            textureSize = (texture.size() / 8)

        }
        
        super.init(texture: texture, color: .white, size: textureSize )
        self.position = position
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(textureSize.width))
        self.physicsBody?.affectedByGravity = false
        let dx = cos(direction) * 150
        let dy = sin(direction) * 150
        self.zPosition = 10
        self.physicsBody?.velocity = CGVector(dx: dx, dy: dy)
        self.physicsBody?.isDynamic = true
        self.physicsBody = SKPhysicsBody(circleOfRadius: max(self.size.width / 2,
                                                               self.size.height / 2))
        
        self.physicsBody?.restitution = 0
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("Could not find the selected projectile")
    }
}
