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

    override func didMove(to view: SKView) {
        addChild(tacoTruck)
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
