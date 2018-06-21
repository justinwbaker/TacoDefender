//
//  Tower.swift
//  TacoDefender
//
//  Created by Justin Baker, Cody Cormeir, and Ben Hancock on 2018-06-20.
//  Copyright © 2018 Justin Baker, Cody Cormeir, and Ben Hancock . All rights reserved.
//

import Foundation
import SpriteKit

func / (left: CGSize, right: CGFloat) -> CGSize{
    
    return CGSize(width: left.width / right, height: left.height / right)
}

func - (left: CGSize, right: CGSize) -> CGSize{
    return CGSize(width: left.width - right.width, height: left.height - right.height)
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
    var range: CGFloat
    var firerate: CDouble
    var type: towerType
    var target: CGPoint
    var towerColor: SKColor
    var colorBlend: CGFloat
    var turret: SKSpriteNode
    var gameTimer: Timer!
    var shootTimer: Timer!

    

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
                turret = SKSpriteNode()
                turret.texture = SKTexture(imageNamed: "bottle_grey_00")
                turret.color = towerColor

            
            case.mustard:
                maxHealth = 7
                range = 3
                firerate = 2
                towerColor = .yellow
                colorBlend = 1
                turret = SKSpriteNode()


            
            case.limeJuice:
                maxHealth = 5
                range = 3
                firerate = 4
                towerColor = .green
                colorBlend = 0.25
                turret = SKSpriteNode()



            
            case.sourCream:
                maxHealth = 5
                range = 4
                firerate = 5
                towerColor = .white
                colorBlend = 0.9
                turret = SKSpriteNode()


            
            case.sriracha:
                maxHealth = 10
                range = 2
                firerate = 8
                towerColor = .red
                colorBlend = 0.5
                turret = SKSpriteNode()


            
            case.chili:
                maxHealth = 0
                range = 0
                firerate = 0 // TODO
                towerColor = .brown
                colorBlend = 0.5
                turret = SKSpriteNode()


            
            case.guacamole:
                maxHealth = 2
                range = 10
                firerate = 7
                towerColor = .green
                colorBlend = 0.8
                turret = SKSpriteNode()


            
            case.tartarSauce:
                maxHealth = 0
                range = 0
                firerate = 0 // TODO
                towerColor = .yellow
                colorBlend = 0.25
                turret = SKSpriteNode()


        }
        health = maxHealth
        target = CGPoint(x: 150, y: 250)
        super.init(texture: texture, color: .white, size: (texture.size()/6))
        gameTimer = Timer.scheduledTimer(timeInterval: 1/30, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        shootTimer = Timer.scheduledTimer(timeInterval: firerate, target: self, selector: #selector(shoot), userInfo: nil, repeats: true)
        self.colorBlendFactor = colorBlend

        self.position = position
        turret.zRotation = self.position.getAngle(CGPoint: target)
        turret.zPosition = 5
        turret.colorBlendFactor = 1
        turret.size = (self.size) - (self.size/8)
        
        addChild(turret)

    }
    
    @objc func update() {
        
    }
    
    // SKAction bit for its update
    // findTarget is first part
    // rotate is second part
    
    @ objc func shoot(){
        //fire projectile at target location as a vector
        
        if (self.position.getDistance(CGPoint: target)) <= range{
            var projectile = Projectile(type: type, direction: self.position.getAngle(CGPoint: target))
        }
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
