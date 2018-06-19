//
//  Projectile.swift
//  TacoDefender
//
//  Created by Ben Hancock on 2018-06-19.
//  Copyright © 2018 justin baker. All rights reserved.
//

import Foundation
import SpriteKit

class projectile: SKSpriteNode {
    
    enum projectileType{
        case ketchup
        case mustard
        case mayonaise
        case guacamole
        case limeJuice
        case sourCream
        case sriracha
        case chili
    }
    
    init(projectileType type: projectileType, CGFloat direction: CGFloat){
        var texture = SKTexture(imageNamed: "Ant")
        self.physicsBody = SKPhysicsBody(circleOfRadius: texture.size().width /2)
        self.physicsBody?.affectedByGravity = false
        let dx = cos(x: direction)
        let dy = sin(y: direction)
        self.physicsBody?.velocity = CGVector(dx: dx, dy: dy)
        
        switch type{
        
        case.ketchup:
            texture = SKTexture(imageNamed: "ketchup")
            
        case.mustard:
            texture = SKTexture(imageNamed: "mustard")
            
        case.mayonaise:
            texture = SKTexture(imageNamed: "mayonaise")
            
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
        }
        
        super.init(texture: texture, color: .white, size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("Could not find the selected projectile")
    }
}
