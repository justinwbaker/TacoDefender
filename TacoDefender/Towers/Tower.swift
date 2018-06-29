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
    var gameTimer = Timer()
    var shootTimer = Timer()
    var closestEnemy: Enemy
    var closestEnemyDist: CGFloat
    var targetInRange: CBool = false // thinking about using this for the timers to prevent lag maybe?

    

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
            
            case.chili: // TODO
                maxHealth = 0
                range = 0
                firerate = 0
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
            
            case.tartarSauce: // TODO
                maxHealth = 0
                range = 0
                firerate = 0
                towerColor = .yellow
                colorBlend = 0.25
                turret = SKSpriteNode()
        }
        health = maxHealth
        target = CGPoint(x: 150, y: 250)
        self.closestEnemy = Enemy()
        self.closestEnemyDist = 0
        super.init(texture: texture, color: .white, size: (texture.size()/6))
        
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        shootTimer = Timer.scheduledTimer(timeInterval: firerate, target: self, selector: #selector(self.shoot), userInfo: nil, repeats: true)

        // invalidate stops a timer
        //shootTimer.invalidate()
        //gameTimer.invalidate()
        
        self.colorBlendFactor = colorBlend
        self.position = position
        turret.zRotation = self.position.getAngle(CGPoint: target)
        turret.zPosition = 5
        turret.colorBlendFactor = 1
        turret.size = (self.size) - (self.size/8)
        addChild(turret)
    }
    
    @objc func update() {
        if(TacoTruck.enemyList.count != 0){
            getClosestEnemy()
            turret.zRotation = self.position.getAngle(CGPoint: closestEnemy.position)
        } //if one+ enemy exists loops through enemies in enemyList and aims at closest
        
        if(health <= 0){
            destroy()
            // maybe created a destroyed animation
        }
    }
    

    
    // SKAction bit for its update
    // findTarget is first part
    // rotate is second part
    
    @objc func shoot(){
        print ("shoot")
        //fire projectile at target location as a vector
        
        if (self.position.getDistance(CGPoint: target)) <= range*1000 {
            let projectile = Projectile(type: type, direction: self.position.getAngle(CGPoint: target), position: self.position)
            self.scene?.addChild(projectile)
        }
        
        /*
         if ((self.position.getDistance(CGPoint: closestEnemy.position)) <= range*1000) && closestEnemy.health > 0 {
             let projectile = Projectile(type: type, direction: self.position.getAngle(CGPoint: closestEnemy.position), position: self.position)
             self.scene?.addChild(projectile)
         } */
         // replace this commented out section with the above section if shooting function works
        
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
    
    func getClosestEnemy(){
        closestEnemyDist = closestEnemy.position.getDistance(CGPoint: self.position)
        for enemy in TacoTruck.enemyList {
            
            if ((closestEnemy .intersects(scene!)) && !closestEnemy.position.equalTo(CGPoint(x:0,y:0))) {
                if(closestEnemyDist > enemy.position.getDistance(CGPoint: self.position)){
                    closestEnemy = enemy
                    
                }
            } // checks if its on screen might still give a null reference but shouldn't?
        }
    }
    
    func upgrade(){
        switch type{
        case.ketchup: // Mustard Upgrade
            maxHealth = 7
            range = 3
            firerate = 2
            towerColor = .yellow
            colorBlend = 1
            turret = SKSpriteNode()
            turret.texture = SKTexture(imageNamed: "bottle_grey_00")
            turret.color = towerColor
            
        case.mustard:
            colorBlend = 1

        case.limeJuice: // SourCream Upgrade
            maxHealth = 5
            range = 4
            firerate = 5
            towerColor = .white
            colorBlend = 0.9
            turret = SKSpriteNode()
            
        case.sourCream:
            colorBlend = 0.9
            
        case.sriracha:
            colorBlend = 0.5
            
        case.chili:
            colorBlend = 0.5
            
        case.guacamole:
            colorBlend = 0.8
            
        case.tartarSauce:
            colorBlend = 0.25

        }
    }

}
