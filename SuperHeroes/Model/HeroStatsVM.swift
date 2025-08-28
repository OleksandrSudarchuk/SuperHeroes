//
//  HeroStatsVM.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 27/08/2025.
//

import Foundation

struct HeroStatsVM {
    let id: Int64
    let name: String
    let imageURL: URL?
    let strength: Int
    let combat: Int
    let intelligence: Int
    let power: Int
    let speed: Int
    let durability: Int
}

extension HeroStatsVM {
    init(hero: Hero) {
        id = hero.id
        name = hero.name ?? ""
        imageURL = URL(string: hero.imageURL ?? "")
        strength = Int(hero.strength)
        combat = Int(hero.combat)
        intelligence = Int(hero.intelligence)
        power = Int(hero.power)
        speed = Int(hero.speed)
        durability = Int(hero.durability)
    }
    
}

extension HeroStatsVM {
    init(api: HeroElement) {
        id = Int64(api.id ?? 0)
        name = api.name ?? ""
        imageURL = URL(string: api.images?.sm ?? "")
        
        intelligence = api.powerstats?.intelligence ?? 0
        strength = api.powerstats?.strength ?? 0
        speed = api.powerstats?.speed ?? 0
        durability = api.powerstats?.durability ?? 0
        power = api.powerstats?.power ?? 0
        combat = api.powerstats?.combat ?? 0
        
    }
}
