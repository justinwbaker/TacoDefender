//
//  Goop.swift
//  TacoDefender
//
//  Created by justin baker on 2018-06-20.
//  Copyright © 2018 justin baker. All rights reserved.
//

import Foundation
import SpriteKit

class Goop: SKSpriteNode {

    var lifetime: CInt
    var radius: CGFloat
    var damage: CInt

    required init?(coder aDecoder: NSCoder) {
        fatalError("use init()")
    }

    init(type: Tower.towerType) {
        var texture = SKTexture(imageNamed: "ketchupGoop")

        lifetime = 1
        radius = 5
        damage = 1

        switch type {
            case .ketchup:
                texture = SKTexture(imageNamed: "ketchupGoop")
            case .mustard:
                texture = SKTexture(imageNamed: "mustardGoop")
            case .guacamole:
                texture = SKTexture(imageNamed: "guacamoleGoop")
            case .limeJuice:
                texture = SKTexture(imageNamed: "limeJuiceGoop")
            case .sourCream:
                texture = SKTexture(imageNamed: "sourCreamGoop")
            case .sriracha:
                texture = SKTexture(imageNamed: "srirachaGoop")
            case .chili:
                texture = SKTexture(imageNamed: "chiliGoop")
            case .tartarSauce:
                texture = SKTexture(imageNamed: "tartarSauceGoop")
        }

        let size = CGSize(width: radius, height: radius)

        super.init(texture: texture, color: .white, size: size)
    }

}
