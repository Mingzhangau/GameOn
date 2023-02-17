//
//  RoundDTO+CoreDataProperties.swift
//  GameOn
//
//  Created by Ming Zhang on 17/2/2023.
//
//

import Foundation
import CoreData

public class RoundDTO: NSManagedObject, Identifiable {

}

extension RoundDTO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoundDTO> {
        return NSFetchRequest<RoundDTO>(entityName: "RoundDTO")
    }

    @NSManaged public var id: Int16
    @NSManaged public var homeScore: Int16
    @NSManaged public var awayScore: Int16
    @NSManaged public var homePlayers: NSSet?
    @NSManaged public var homeTeam: TeamDTO?
    @NSManaged public var awayPlayers: NSSet?
    @NSManaged public var awayTeam: TeamDTO?
    @NSManaged public var roundToGame: GameDTO?

}

// MARK: Generated accessors for homePlayers
extension RoundDTO {

    @objc(addHomePlayersObject:)
    @NSManaged public func addToHomePlayers(_ value: PlayerDTO)

    @objc(removeHomePlayersObject:)
    @NSManaged public func removeFromHomePlayers(_ value: PlayerDTO)

    @objc(addHomePlayers:)
    @NSManaged public func addToHomePlayers(_ values: NSSet)

    @objc(removeHomePlayers:)
    @NSManaged public func removeFromHomePlayers(_ values: NSSet)

}

// MARK: Generated accessors for awayPlayers
extension RoundDTO {

    @objc(addAwayPlayersObject:)
    @NSManaged public func addToAwayPlayers(_ value: PlayerDTO)

    @objc(removeAwayPlayersObject:)
    @NSManaged public func removeFromAwayPlayers(_ value: PlayerDTO)

    @objc(addAwayPlayers:)
    @NSManaged public func addToAwayPlayers(_ values: NSSet)

    @objc(removeAwayPlayers:)
    @NSManaged public func removeFromAwayPlayers(_ values: NSSet)

}
