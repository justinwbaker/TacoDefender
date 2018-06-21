//
//  TacoTruck.swift
//  TacoDefender
//
//  Created by justin baker on 2018-06-18.
//  Copyright © 2018 justin baker. All rights reserved.
//

import Foundation
import SpriteKit

class TacoTruck: SKSpriteNode {

    var tacos = 5
    var foodPoints = 100


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

}
