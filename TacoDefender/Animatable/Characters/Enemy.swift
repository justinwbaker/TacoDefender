//
//  Enemy.swift
//  TacoDefender
//
//  Created by Justin Baker, Cody Cormeir, and Ben Hancock on 2018-06-20.
//  Copyright © 2018 Justin Baker, Cody Cormeir, and Ben Hancock . All rights reserved.
//

import Foundation
import SpriteKit

class Enemy: SKSpriteNode{
    
    var health: CInt

    required init?(coder aDecoder: NSCoder) {
        fatalError("use init()")
    }

    init() {
        let texture = SKTexture(imageNamed: "Ant")
        self.health = 0
        super.init(texture: texture, color: .white, size: texture.size())
    }
    
    func addEnemyToArray(){
        
    }

    func takeDamage(damage: CInt){

    }
    
    func update(){
        
    }
    
}
