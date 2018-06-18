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

    required init?(coder aDecoder: NSCoder) {
        fatalError("Use init()")
    }

    init() {
        let texture = SKTexture(imageNamed: "Taco")
        super.init(texture: texture, color: .white, size: texture.size())

        name = "TacoTruck"
        zPosition = 50
    }

}
