//
//  GameScene.swift
//  TacoDefender
//
//  Created by justin baker on 2018-06-14.
//  Copyright © 2018 justin baker. All rights reserved.
//

import SpriteKit
import GameplayKit

extension CGPoint {
    func getDistance(CGPoint point: CGPoint) -> CGFloat{
        let dx = point.x - self.x
        let dy = point.y - self.y
        return sqrt(dx*dx-dy*dy)
    }
    
    func getAngle(CGPoint point: CGPoint) -> CGFloat {
        let dx = point.x - self.x
        let dy = point.y - self.y
        return atan(dy/dx)
    }
}

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
