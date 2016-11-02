//
//  Game.swift
//  Overwatch
//
//  Created by Felicity Johnson on 10/21/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

struct Game {
    var offenseCharacters: [Hero] = []
    var defenseCharacters: [Hero] = []
    var tankCharacters: [Hero] = []
    var supportCharacters: [Hero] = []
    var heroType: HeroType = .offense
    var heroes: [Hero] {
        return heroesForType()
    }
    
    init() {
        createAllHereos()
    }
}

extension Game {
    mutating func createAllHereos() {
        for type in HeroType.allTypes {
            let heroList = HeroName.hereos(with: type)
            for hero in heroList {
                let newHero = Hero(name: hero)
                switch newHero.heroType {
                case .offense:
                    offenseCharacters.append(newHero)
                case .defense:
                    defenseCharacters.append(newHero)
                case .support:
                    supportCharacters.append(newHero)
                case .tank:
                    tankCharacters.append(newHero)
                }
            }
        }
    }

    func heroesForType() -> [Hero] {
        switch heroType {
        case .offense:
            return offenseCharacters
        case .defense:
            return defenseCharacters
        case .tank:
            return tankCharacters
        case .support:
            return supportCharacters
        }
    }
}

