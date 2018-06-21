//
//  Tower.swift
//  TacoDefender
//
//  Created by justin baker on 2018-06-20.
//  Copyright © 2018 justin baker. All rights reserved.
//

import Foundation
import SpriteKit

class Tower: SKSpriteNode {
    
    enum towerType {
        case ketchup
        case mustard
        case guacamole
        case limeJuice
        case sourCream
        case sriracha
        case chili
        case tartarSauce
    }

    var health: CInt
    var maxHealth: CInt
    var range: CInt
    var firerate: CInt
    var type: towerType
    var target: CGPoint
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("use init()")
    }

    init(towerType tower: towerType, CGPoint position: CGPoint) {
        let texture = SKTexture(imageNamed: "TowerBase")
        type = tower
        switch type{
            case.ketchup:
                maxHealth = 5
                range = 3
                firerate = 2
            
            case.mustard:
                maxHealth = 7
                range = 3
                firerate = 2
            
            case.limeJuice:
                maxHealth = 5
                range = 3
                firerate = 4
            
            case.sourCream:
                maxHealth = 5
                range = 4
                firerate = 5
            
            case.sriracha:
                maxHealth = 10
                range = 2
                firerate = 8
            
            case.chili:
                maxHealth = 0
                range = 0
                firerate = 0 // TODO
            
            case.guacamole:
                maxHealth = 2
                range = 10
                firerate = 7
            
            case.tartarSauce:
                maxHealth = 0
                range = 0
                firerate = 0 // TODO
        }
        health = maxHealth
        target = CGPoint(x: 0, y: 0)
        super.init(texture: texture, color: .white, size: texture.size())
        self.position = position
        self.zRotation = self.position.getAngle(CGPoint: target)
    }

}
