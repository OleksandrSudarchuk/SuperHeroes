//
//  Hero+CoreDataProperties.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 27/08/2025.
//
//

import Foundation
import CoreData


extension Hero {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Hero> {
        return NSFetchRequest<Hero>(entityName: "Hero")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var strength: Int16
    @NSManaged public var combat: Int16
    @NSManaged public var intelligence: Int16
    @NSManaged public var power: Int16
    @NSManaged public var speed: Int16
    @NSManaged public var durability: Int16
    @NSManaged public var isFavorite: Bool
    @NSManaged public var favoritedAt: Date?
    @NSManaged public var updateAt: Date?

}

extension Hero : Identifiable {

}
