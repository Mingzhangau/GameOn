//
//  PlayerDTO+CoreDataProperties.swift
//  GameOn
//
//  Created by Ming Zhang on 17/2/2023.
//
//

import Foundation
import CoreData

public class PlayerDTO: NSManagedObject, Identifiable {

}

extension PlayerDTO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlayerDTO> {
        return NSFetchRequest<PlayerDTO>(entityName: "PlayerDTO")
    }

    @NSManaged public var id: String
    @NSManaged public var isInOptions: Bool
    @NSManaged public var homePlayerToRound: NSSet?
    @NSManaged public var awayPlayerToRound: NSSet?

}

// MARK: Generated accessors for homePlayerToRound
extension PlayerDTO {

    @objc(addHomePlayerToRoundObject:)
    @NSManaged public func addToHomePlayerToRound(_ value: RoundDTO)

    @objc(removeHomePlayerToRoundObject:)
    @NSManaged public func removeFromHomePlayerToRound(_ value: RoundDTO)

    @objc(addHomePlayerToRound:)
    @NSManaged public func addToHomePlayerToRound(_ values: NSSet)

    @objc(removeHomePlayerToRound:)
    @NSManaged public func removeFromHomePlayerToRound(_ values: NSSet)

}

// MARK: Generated accessors for awayPlayerToRound
extension PlayerDTO {

    @objc(addAwayPlayerToRoundObject:)
    @NSManaged public func addToAwayPlayerToRound(_ value: RoundDTO)

    @objc(removeAwayPlayerToRoundObject:)
    @NSManaged public func removeFromAwayPlayerToRound(_ value: RoundDTO)

    @objc(addAwayPlayerToRound:)
    @NSManaged public func addToAwayPlayerToRound(_ values: NSSet)

    @objc(removeAwayPlayerToRound:)
    @NSManaged public func removeFromAwayPlayerToRound(_ values: NSSet)

}
