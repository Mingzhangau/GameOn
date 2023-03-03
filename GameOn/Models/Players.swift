//
//  Players.swift
//  GameOn
//
//  Created by Ming Zhang on 11/1/2023.
//

import Foundation
import CoreData

struct Player: Equatable, ExpressibleByStringLiteral, Identifiable {
    // MARK: Lifecycle

    public init(stringLiteral value: StringLiteralType) {
        id = value
        isInOptions = true
    }

    public init(id: String, isInOptions: Bool) {
        self.id = id
        self.isInOptions = isInOptions
    }

    // MARK: Internal

    let id: String
    var isInOptions: Bool
    var gameRecord: GameRecord = .init()

    var name: String {
        id
    }
    
    static func ==(left: Player, right: Player) -> Bool {
        return left.id == right.id
    }

    mutating func recordResult(result: GameResult) {
        switch result {
        case .win: gameRecord.recordWin()
        case .draw: gameRecord.recordDraw()
        case .lose: gameRecord.recordLose()
        case .abcent: break
        }
    }

    mutating func cancelResult(result: GameResult) {
        switch result {
        case .win: gameRecord.cancelWin()
        case .draw: gameRecord.cancelDraw()
        case .lose: gameRecord.cancelLose()
        case .abcent: break
        }
    }
}
