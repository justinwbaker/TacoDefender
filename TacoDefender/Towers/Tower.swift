//
//  Tower.swift
//  TacoDefender
//
//  Created by justin baker on 2018-06-20.
//  Copyright © 2018 justin baker. All rights reserved.
//

import Foundation
import SpriteKit

func / (left: CGSize, right: CGFloat) -> CGSize{
    
    return CGSize(width: left.width / right, height: left.height / right)
}

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
    var towerColor: SKColor
    var colorBlend: CGFloat
    

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
                towerColor = .red
                colorBlend = 1

            
            case.mustard:
                maxHealth = 7
                range = 3
                firerate = 2
                towerColor = .yellow
                colorBlend = 1

            
            case.limeJuice:
                maxHealth = 5
                range = 3
                firerate = 4
                towerColor = .green
                colorBlend = 0.25


            
            case.sourCream:
                maxHealth = 5
                range = 4
                firerate = 5
                towerColor = .white
                colorBlend = 0.9


            
            case.sriracha:
                maxHealth = 10
                range = 2
                firerate = 8
                towerColor = .red
                colorBlend = 0.5


            
            case.chili:
                maxHealth = 0
                range = 0
                firerate = 0 // TODO
                towerColor = .brown
                colorBlend = 0.5


            
            case.guacamole:
                maxHealth = 2
                range = 10
                firerate = 7
                towerColor = .green
                colorBlend = 0.8


            
            case.tartarSauce:
                maxHealth = 0
                range = 0
                firerate = 0 // TODO
                towerColor = .yellow
                colorBlend = 0.25


        }
        health = maxHealth
        target = CGPoint(x: 0, y: 0)
        super.init(texture: texture, color: .white, size: (texture.size()/6))
        self.colorBlendFactor = colorBlend

        self.position = position
        self.zRotation = self.position.getAngle(CGPoint: target)
    }
    
    // SKAction bit for its update
    // findTarget is first part
    // rotate is second part
    
    func shoot(CGPoint target: CGPoint){
        //fire projectile at target location as a vector
    }
    
    func destroy(){
        removeFromParent()
    }
    
    func sell(){
        removeFromParent()
        //Add foodpoints
    }
    
    func takeDamage(CInt damage: CInt){
        self.health -= damage
    }
    
    func upgrade(){
        
    }

}
