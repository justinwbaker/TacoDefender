//
//  GameScene.swift
//  TacoDefender
//
//  Created by Justin Baker, Cody Cormier, and Ben Hancock on 2018-06-20.
//  Copyright © 2018 Justin Baker, Cody Cormier, and Ben Hancock . All rights reserved.
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
        return CGFloat.pi - atan(dx/dy)
    }
}



class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var tacoTruck = TacoTruck()
    var test = Tower(towerType: Tower.towerType.ketchup, CGPoint: CGPoint(x: 150, y: 150))

    override func didMove(to view: SKView) {
        addChild(tacoTruck)
        addChild(test)
    }

    func touchDown(atPoint pos : CGPoint) {
        if(0 == 0){
            
        }
        else if(1 == 1){
            
        }
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
