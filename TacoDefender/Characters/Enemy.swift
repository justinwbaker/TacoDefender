//
//  Enemy.swift
//  TacoDefender
//
//  Created by Justin Baker, Cody Cormier, and Ben Hancock on 2018-06-20.
//  Copyright © 2018 Justin Baker, Cody Cormier, and Ben Hancock . All rights reserved.
//

import Foundation
import SpriteKit



class Enemy: SKSpriteNode{
    
    static var wave: CInt = 0

    var health: CInt
    var moveSpeed: CGFloat
    var damage: CInt
    var direction: CGFloat = 0.0

    required init?(coder aDecoder: NSCoder) {
        fatalError("use init()")
    }

    init() {
        let texture = SKTexture(imageNamed: "Ant")
        self.health = 10
        self.damage = 1
        self.moveSpeed = 100
        
        super.init(texture: texture, color: .white, size: texture.size())
        self.position = CGPoint(x: -250, y: 600)

        self.direction = self.position.getAngle(CGPoint: CGPoint(x: 0, y: 0))
        zPosition = 6
        self.zRotation = self.direction

        print(health, damage, moveSpeed, direction)
        TacoTruck.enemyList.append(self)
        
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width,
                                                                             height: self.size.height))
        
    }
    
    func addEnemyToArray(){
        TacoTruck.enemyList.append(self)
        
    }

    func takeDamage(damage: CInt){
        health -= damage
    }
    
    func update(){
        self.position.x += moveSpeed * sin(direction)
        self.position.y += moveSpeed * cos(direction)
        
        if self.health <= 0{
            removeEnemy()
        }
    }
    
    func removeEnemy(){
        let enemyposition: Int = TacoTruck.enemyList.index(of: self)!
        TacoTruck.enemyList.remove(at: Int(enemyposition))
        self.removeFromParent()
        print("Enemy Destroyed")
    }
    

    
}
