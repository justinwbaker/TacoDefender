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
        return atan(dx/dy) + CGFloat.pi
    }
}



class GameScene: SKScene {

    var tacoTruck = TacoTruck()
    var test = Tower(towerType: Tower.towerType.ketchup, CGPoint: CGPoint(x: 150, y: 150))

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
