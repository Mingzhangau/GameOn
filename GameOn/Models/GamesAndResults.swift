//
//  GamesAndResults.swift
//  GameOn
//
//  Created by Ming Zhang on 11/1/2023.
//

import Foundation

// MARK: - Round

struct Round: Identifiable {
    var id: Int
    var players: [Player]
    var teams: [Team]
    var goals: [Int] = []
    var scoreInThisRound: [GameResult] = []

    mutating func setGoals(host: Int, away: Int) {
        goals = [host, away]
    }

    mutating func setResult(goals: [Int]) {
        if goals[0] > goals[1] {
            scoreInThisRound = [.win, .win, .lose, .lose]
        } else if goals[0] == goals[1] {
            scoreInThisRound = [.draw, .draw, .draw, .draw]
        } else {
            scoreInThisRound = [.lose, .lose, .win, .win]
        }
    }
}

// MARK: - Game

struct Game {
    // MARK: Lifecycle

    init(
        players: [Player],
        teams: [Team],
        rounds: [Round] = [],
        scoresSoFar: [Int] = [0, 0, 0, 0],
        winnersSoFar: [Player] = []
    ) {
        self.players = players
        self.teams = teams
        self.rounds = rounds
        self.scoresSoFar = scoresSoFar
        self.winnersSoFar = winnersSoFar
    }

    // MARK: Internal

    var players: [Player]
    var teams: [Team]
    var rounds: [Round]
    var scoresSoFar: [Int]
    var winnersSoFar: [Player]

    var currentRound: Round? { rounds.last }
    var previoursRound: Round? {
        rounds.count > 1 ? rounds.last : nil
    }

    func choosePlayersInRound(numberOfPlayers: Int) -> [Player] {
        var option = Array(players.shuffled().prefix(numberOfPlayers))

        while option == previoursRound?.players {
            option = Array(players.shuffled().prefix(numberOfPlayers))
        }
        return option
    }

    func chooseTeamsInRound() -> [Team] {
        var option = Array(teams.shuffled().prefix(2))

        if let previoursRound = previoursRound {
            while option == previoursRound.teams {
                option = Array(teams.shuffled().prefix(2))
            }
        }
        return option
    }

    mutating func startNewRound() {
        rounds.append(
            Round(
                id: rounds.count,
                players: choosePlayersInRound(numberOfPlayers: 4),
                teams: chooseTeamsInRound()
            )
        )
    }

    mutating func deleteRound(indexSet: IndexSet) {
        for index in indexSet {
            if rounds[index].scoreInThisRound != [] {
                deleteRoundRecord(index: index)
            }
        }

        rounds.remove(atOffsets: indexSet)
    }

    mutating func recordRound(index: Int, homeScore: Int, awayScore: Int) {
        if rounds[index].scoreInThisRound != [] {
            deleteRoundRecord(index: index)
        }

        rounds[index].setGoals(host: homeScore, away: awayScore)
        rounds[index].setResult(goals: [homeScore, awayScore])

        addRoundRecord(index: index)
    }

    mutating func addRoundRecord(index: Int) {
        for i in 0 ... 3 {
            players[i].recordResult(result: rounds[index].scoreInThisRound[i])
            for j in 0 ... 3 {
                if players[j].id == rounds[index].players[i].id {
                    increaseScoreSoFar(index: j, score: rounds[index].scoreInThisRound[i].toInt())
                }
            }
        }
        teams[0].recordResult(result: rounds[index].scoreInThisRound[0])
        teams[1].recordResult(result: rounds[index].scoreInThisRound[2])
    }

    mutating func deleteRoundRecord(index: Int) {
        for i in 0 ... 3 {
            players[i].cancelResult(result: rounds[index].scoreInThisRound[i])
            for j in 0 ... 3 {
                if players[j].id == rounds[index].players[i].id {
                    decreaseScoreSoFar(index: j, score: rounds[index].scoreInThisRound[i].toInt())
                }
            }
        }
        teams[0].cancelResult(result: rounds[index].scoreInThisRound[0])
        teams[1].cancelResult(result: rounds[index].scoreInThisRound[2])
    }

    mutating func increaseScoreSoFar(index: Int, score: Int) {
        scoresSoFar[index] += score
    }

    mutating func decreaseScoreSoFar(index: Int, score: Int) {
        scoresSoFar[index] -= score
    }

    func finishGame() {
        // Accumulate the game record to App
    }
}
