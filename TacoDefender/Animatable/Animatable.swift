//
//  Animatable.swift
//  TacoDefender
//
//  Created by Cody Cormier on 2018-06-26.
//  Copyright © 2018 easterndevelopers.ca. All rights reserved.
//

import SpriteKit

protocol Animatable{
    var animations: [SKAction]{get set}

}

extension Animatable{
    func animationDirection(for directionVector: CGVector) -> Direction{
        let direction: Direction
        if abs(directionVector.dy) > abs(directionVector.dx){
            direction = directionVector.dy < 0 ? .forward: .backward
        }
        else{
            direction = directionVector.dx < 0 ? .left: .right
        }
        return direction
    }
}

// add to Enemy class outside class 'extension Enemy: Animatable{}
// also add this to enemy class 'var animations: [SKAction] = []
