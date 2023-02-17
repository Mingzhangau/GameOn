//
//  TeamDTO+CoreDataProperties.swift
//  GameOn
//
//  Created by Ming Zhang on 17/2/2023.
//
//

import Foundation
import CoreData

public class TeamDTO: NSManagedObject, Identifiable {

}


extension TeamDTO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TeamDTO> {
        return NSFetchRequest<TeamDTO>(entityName: "TeamDTO")
    }

    @NSManaged public var id: String
    @NSManaged public var isInOptions: Bool
    @NSManaged public var homeTeamToRound: NSSet?
    @NSManaged public var awayTeamToRound: NSSet?

}

// MARK: Generated accessors for homeTeamToRound
extension TeamDTO {

    @objc(addHomeTeamToRoundObject:)
    @NSManaged public func addToHomeTeamToRound(_ value: RoundDTO)

    @objc(removeHomeTeamToRoundObject:)
    @NSManaged public func removeFromHomeTeamToRound(_ value: RoundDTO)

    @objc(addHomeTeamToRound:)
    @NSManaged public func addToHomeTeamToRound(_ values: NSSet)

    @objc(removeHomeTeamToRound:)
    @NSManaged public func removeFromHomeTeamToRound(_ values: NSSet)

}

// MARK: Generated accessors for awayTeamToRound
extension TeamDTO {

    @objc(addAwayTeamToRoundObject:)
    @NSManaged public func addToAwayTeamToRound(_ value: RoundDTO)

    @objc(removeAwayTeamToRoundObject:)
    @NSManaged public func removeFromAwayTeamToRound(_ value: RoundDTO)

    @objc(addAwayTeamToRound:)
    @NSManaged public func addToAwayTeamToRound(_ values: NSSet)

    @objc(removeAwayTeamToRound:)
    @NSManaged public func removeFromAwayTeamToRound(_ values: NSSet)

}
