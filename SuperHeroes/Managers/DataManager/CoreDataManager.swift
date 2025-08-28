//
//  CoreDataManager.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 27/08/2025.
//

import CoreData

struct CoreDataManager {
    static func upsert(heroes: [HeroElement], container: NSPersistentContainer) throws {
        let context = container.newBackgroundContext()
        try context.performAndWait {
            for dto in heroes {
                guard let rawID = dto.id as Int? else {
                    continue
                }
               let id64 = Int64(rawID)
                let req: NSFetchRequest<Hero> = Hero.fetchRequest()
                req.predicate = NSPredicate(format: "id == %@", NSNumber(value: id64))
                req.fetchLimit = 1
                let hero = try context.fetch(req).first ?? Hero(context: context)
                
                hero.id = id64
                hero.name = dto.name
                hero.imageURL = dto.images?.sm
                
                hero.strength = i16(dto.powerstats?.strength)
                hero.durability = i16(dto.powerstats?.durability)
                hero.speed = i16(dto.powerstats?.speed)
                hero.power = i16(dto.powerstats?.power)
                hero.combat = i16(dto.powerstats?.strength)
                hero.intelligence = i16(dto.powerstats?.intelligence)
            }
            if context.hasChanges {try context.save()}
            
        }
        
    }
    
}

func i16(_ value: Int?) -> Int16 {
   guard let v = value else { return 0 }
   if v < Int(Int16.min) { return Int16.min }
   if v > Int(Int16.max) { return Int16.max }
   return Int16(v)
}
