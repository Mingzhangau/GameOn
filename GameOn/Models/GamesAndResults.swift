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
    var scoreInThisRound: [Int] = []

    mutating func setGoals(host: Int, away: Int) {
        goals = [host, away]
    }

    mutating func setScore(goals: [Int]) {
        if goals[0] > goals[1] {
            scoreInThisRound = [3, 3, 0, 0]
        } else if goals[0] == goals[1] {
            scoreInThisRound = [1, 1, 1, 1]
        } else {
            scoreInThisRound = [0, 0, 3, 3]
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
        scoresSoFar: [Int] = [],
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
        rounds.remove(atOffsets: indexSet)
    }

    mutating func recordRound(index: Int, homeScore: Int, awayScore: Int) {
        rounds[index].setGoals(host: homeScore, away: awayScore)
        rounds[index].setScore(goals: [homeScore, homeScore])
    }
}
