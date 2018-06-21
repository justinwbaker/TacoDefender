//
//  Goop.swift
//  TacoDefender
//
//  Created by Justin Baker, Cody Cormeir, and Ben Hancock on 2018-06-20.
//  Copyright © 2018 Justin Baker, Cody Cormeir, and Ben Hancock . All rights reserved.
//

import Foundation
import SpriteKit

class Goop: SKSpriteNode {

    var lifetime: CGFloat
    var radius: CGFloat
    var damage: CInt

    var gameTimer: Timer!

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
        gameTimer = Timer.scheduledTimer(timeInterval: 1/30, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }

    @objc func update() {
        lifetime -= 1/30
        self.alpha -= 0.1
        self.size = CGSize(width: self.size.width - 1/30, height: self.size.height - 1/30)
        if(lifetime <= 0) {
            destroy()
        }
    }

    func destroy() {
        self.removeFromParent()
    }

    override func intersects(_ node: SKNode) -> Bool {
        if(node is Enemy) {
            let enemy: Enemy = node as! Enemy
            enemy.takeDamage(damage: damage)
            return true
        }
        return false
    }

}
