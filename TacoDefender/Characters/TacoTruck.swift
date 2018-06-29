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



    required init?(coder aDecoder: NSCoder) {
        fatalError("Use init()")
    }

    init() {
        let texture = SKTexture(imageNamed: "TacoTruck")
        let size = CGSize(width: texture.size().width/6, height: texture.size().height/6)

        super.init(texture: texture, color: .white, size: size)

        name = "TacoTruck"
        zPosition = 3

    }
    
    func increaseWave(){
        Enemy.wave += 1
    }
    
    func lose(){
        
    }
    


}
