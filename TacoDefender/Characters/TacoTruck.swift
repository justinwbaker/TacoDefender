//
//  TacoTruck.swift
//  TacoDefender
//
//  Created by Justin Baker, Cody Cormeir, and Ben Hancock on 2018-06-20.
//  Copyright © 2018 Justin Baker, Cody Cormeir, and Ben Hancock . All rights reserved.
//

import Foundation
import SpriteKit

class TacoTruck: SKSpriteNode {

    var tacos = 5
    var foodPoints = 100
    static var enemyList: Array<Enemy> = Array()
    static var towerList: Array<Tower> = Array()
    var gameTimer = Timer()



    required init?(coder aDecoder: NSCoder) {
        fatalError("Use init()")
    }

    init() {
        let texture = SKTexture(imageNamed: "TacoTruck")
        let size = CGSize(width: texture.size().width/6, height: texture.size().height/6)
 
        super.init(texture: texture, color: .white, size: size)
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        name = "TacoTruck"
        zPosition = 8

    }
    
    func increaseWave(){
        Enemy.wave += 1
    }
    
    func lose(){
        
    }
    
    @objc func update(){
        for enemy in TacoTruck.enemyList {
            enemy.update()
        }
        
        for tower in TacoTruck.towerList {
            tower.update()
        }
        
    }
    


}
