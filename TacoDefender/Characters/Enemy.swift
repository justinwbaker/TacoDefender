//
//  Enemy.swift
//  TacoDefender
//
//  Created by justin baker on 2018-06-20.
//  Copyright © 2018 justin baker. All rights reserved.
//

import Foundation
import SpriteKit

class Enemy: SKSpriteNode{

    required init?(coder aDecoder: NSCoder) {
        fatalError("use init()")
    }

    init() {
        let texture = SKTexture(imageNamed: "Ant")
        super.init(texture: texture, color: .white, size: texture.size())
    }

    func takeDamage(damage: CInt){

    }
    
}
