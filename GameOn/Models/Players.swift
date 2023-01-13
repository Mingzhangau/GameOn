//
//  Players.swift
//  GameOn
//
//  Created by Ming Zhang on 11/1/2023.
//

import Foundation

struct Player: Equatable, ExpressibleByStringLiteral, Identifiable {
    // MARK: Lifecycle

//    var historyScore: Int
//    var historyGamePlayed: Int

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

    var name: String {
        id
    }
}

// enum Players : Player {
//
//    typealias RawValue = Player
//
//    case Ming, Joel, James, Chang
//
//    init?(rawValue: Player) {
//        switch rawValue.id {
//        case "Ming": self = .Ming
//        case "Joel": self = .Joel
//        case "James": self = .James
//        case "Chang": self = .Chang
//        default:
//            return nil
//        }
//    }
//
//    var rawValue: Player {
//        switch self {
//        case .Ming : return Player(stringLiteral: "Ming")
//        case .Joel : return Player(stringLiteral: "Joel")
//        case .James : return Player(stringLiteral: "James")
//        case .Chang : return Player(stringLiteral: "Chang")
//        }
//    }
// }
