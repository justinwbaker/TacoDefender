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
    var direction: CGFloat

    required init?(coder aDecoder: NSCoder) {
        fatalError("use init()")
    }

    init() {
        let texture = SKTexture(imageNamed: "Ant")
        self.health = 10
        self.damage = 1
        self.moveSpeed = 100
        self.direction = self.position.getAngle(CGPoint: CGPoint(x: 0, y: 0))
        super.init(texture: texture, color: .white, size: texture.size())
        print(health, damage, moveSpeed, direction)
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
    }
    
    func removeEnemy(){
        let enemyposition: Int = TacoTruck.enemyList.index(of: self)!
        TacoTruck.enemyList.remove(at: Int(enemyposition))
        self.removeFromParent()
    }
    

    
}
