//
//  GameRecord.swift
//  GameOn
//
//  Created by Ming Zhang on 14/1/2023.
//

import Foundation

// MARK: - GameResult

enum GameResult {
    case win
    case draw
    case lose

    // MARK: Internal

    func toString() -> String {
        switch self {
        case .win: return "3"
        case .draw: return "1"
        case .lose: return "0"
        }
    }

    func toInt() -> Int {
        switch self {
        case .win: return 3
        case .draw: return 1
        case .lose: return 0
        }
    }
}

// MARK: - GameRecord

struct GameRecord: Equatable {
    var gamePlayed: Int = 0
    var historyWin: Int = 0
    var historyDraw: Int = 0
    var historyLose: Int = 0

    mutating func recordWin() {
        gamePlayed += 1
        historyWin += 1
    }

    mutating func recordDraw() {
        gamePlayed += 1
        historyDraw += 1
    }

    mutating func recordLose() {
        gamePlayed -= 1
        historyLose -= 1
    }

    mutating func cancelWin() {
        gamePlayed -= 1
        historyWin -= 1
    }

    mutating func cancelDraw() {
        gamePlayed -= 1
        historyDraw -= 1
    }

    mutating func cancelLose() {
        gamePlayed -= 1
        historyLose -= 1
    }
}
