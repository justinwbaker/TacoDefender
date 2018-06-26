//
//  GameScene.swift
//  TacoDefender
//
//  Created by Justin Baker, Cody Cormeir, and Ben Hancock on 2018-06-20.
//  Copyright © 2018 Justin Baker, Cody Cormeir, and Ben Hancock . All rights reserved.
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
    static var enemyList: Array<Enemy> = Array() // trying to get this to work not using the physics comparisions 

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
