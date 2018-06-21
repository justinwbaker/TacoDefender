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
    
    init(type: Tower.towerType, direction: CGFloat){
        var texture = SKTexture(imageNamed: "Ant")
        
        switch type{
        
        case.ketchup:
            texture = SKTexture(imageNamed: "ketchup")
            
        case.mustard:
            texture = SKTexture(imageNamed: "mustard")
            
        /*case.mayonaise:
            texture = SKTexture(imageNamed: "mayonaise")*/
            
        case.guacamole:
            texture = SKTexture(imageNamed: "guacamole")
            
        case.limeJuice:
            texture = SKTexture(imageNamed: "limeJuice")
            
        case.sourCream:
            texture = SKTexture(imageNamed: "sourCream")
          
        case.sriracha:
            texture = SKTexture(imageNamed: "sriracha")
            
        case.chili:
            texture = SKTexture(imageNamed: "chili")

        case .tartarSauce:
            texture = SKTexture(imageNamed: "tartarSauce")
        }
        
        super.init(texture: texture, color: .white, size: texture.size())

        self.physicsBody = SKPhysicsBody(circleOfRadius: (texture.size().width / 2))
        self.physicsBody?.affectedByGravity = false
        let dx = cos(direction) * 100
        let dy = sin(direction) * 100
        self.physicsBody?.velocity = CGVector(dx: dx, dy: dy)
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("Could not find the selected projectile")
    }
}
