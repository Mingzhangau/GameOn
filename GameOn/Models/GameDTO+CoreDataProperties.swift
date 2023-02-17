//
//  GameDTO+CoreDataProperties.swift
//  GameOn
//
//  Created by Ming Zhang on 17/2/2023.
//
//

import Foundation
import CoreData

public class GameDTO: NSManagedObject, Identifiable {

}

extension GameDTO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameDTO> {
        return NSFetchRequest<GameDTO>(entityName: "GameDTO")
    }

    @NSManaged public var id: Int16
    @NSManaged public var date: Date?
    @NSManaged public var rounds: NSSet?

}

// MARK: Generated accessors for rounds
extension GameDTO {

    @objc(addRoundsObject:)
    @NSManaged public func addToRounds(_ value: RoundDTO)

    @objc(removeRoundsObject:)
    @NSManaged public func removeFromRounds(_ value: RoundDTO)

    @objc(addRounds:)
    @NSManaged public func addToRounds(_ values: NSSet)

    @objc(removeRounds:)
    @NSManaged public func removeFromRounds(_ values: NSSet)

}
