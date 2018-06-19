//
//  GameScene.swift
//  TacoDefender
//
//  Created by justin baker on 2018-06-14.
//  Copyright © 2018 justin baker. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var tacoTruck = TacoTruck()
    var test = Projectile(projectileType: Projectile.projectileType.ketchup, CGFloat: 45.0)

    override func didMove(to view: SKView) {
        addChild(tacoTruck)
        addChild(test)
    }

    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    
    override func update(_ currentTime: TimeInterval) {

    }
}
