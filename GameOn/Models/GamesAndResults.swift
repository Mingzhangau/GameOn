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
        var result: [GameResult] = []
        var teamBStartIndex = 2
        var teamBEndIndex = 3
        switch players.count {
        case 2:
            teamBStartIndex = 1
            teamBEndIndex = 1
        case 3:
            teamBStartIndex = 2
            teamBEndIndex = 2
        case 4:
            teamBStartIndex = 2
            teamBEndIndex = 3
        case 5:
            teamBStartIndex = 2
            teamBEndIndex = 3
        default:
            teamBStartIndex = 2
            teamBEndIndex = 3
        }
        if goals[0] > goals[1] {
            for _ in 0 ... teamBStartIndex-1 {
                result.append(.win)
            }
            for _ in teamBStartIndex ... teamBEndIndex {
                result.append(.lose)
            }
            
            for _ in min(teamBEndIndex + 1, players.count)...players.count {
                result.append(.abcent)
            }

        } else if goals[0] == goals[1] {
            for _ in 0 ... teamBEndIndex{
                result.append(.draw)
            }
            for _ in min(teamBEndIndex + 1, players.count) ... players.count {
                result.append(.abcent)
            }
        } else {
            for _ in 0 ... teamBStartIndex-1 {
                result.append(.lose)
            }
            for _ in teamBStartIndex ... teamBEndIndex {
                result.append(.win)
            }
            
            for _ in min(teamBEndIndex + 1, players.count)...players.count {
                result.append(.abcent)
            }
        }
        scoreInThisRound = result
    }
}

// MARK: - Game

struct Game {
    // MARK: Lifecycle

    init(
        players: [Player],
        teams: [Team],
        rounds: [Round] = [],
        scoresSoFar: [Int] = [0, 0, 0, 0, 0, 0, 0, 0],
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
        !rounds.isEmpty ? rounds.last : nil
    }

    func choosePlayersInRound(numberOfPlayers: Int) -> [Player] {
        var option = Array(players.shuffled().prefix(numberOfPlayers))
        let team2Index = numberOfPlayers / 2

        if let previoursRound = previoursRound {
            let firstIndex = option.firstIndex { $0.id == previoursRound.players[0].id }
            option.swapAt(0, firstIndex ?? 0)

            let secondIndex = option.firstIndex { $0.id == previoursRound.players[1].id
            }
            option.swapAt(team2Index, secondIndex ?? team2Index)
            
            for player in players {
                if !previoursRound.players.contains(player) {
                    if !option.contains(player) {
                        option[0] = player
                    }
                }
            }
        }
        

        return option
    }

    func chooseTeamsInRound() -> [Team] {
        var option = Array(teams.shuffled().prefix(2))

        if let previoursRound = previoursRound {
            while
                previoursRound.teams.contains(option[0]) || previoursRound.teams
                    .contains(option[1])
            {
                option = Array(teams.shuffled().prefix(2))
            }
        }
        return option
    }

    mutating func startNewRound() {
        rounds.append(
            Round(
                id: rounds.count,
                players: choosePlayersInRound(numberOfPlayers: min(players.count, 4)),
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
        for i in 0 ... players.count - 1 {
            
            for j in 0 ... players.count - 1 {
                let roundPlayerNumber = min(rounds[index].players.count-1, i)
                if players[j].id == rounds[index].players[roundPlayerNumber].id {
                    players[j].recordResult(result: rounds[index].scoreInThisRound[i])
                    increaseScoreSoFar(index: j, score: rounds[index].scoreInThisRound[i].toInt())
                }
            }
        }
        teams[0].recordResult(result: rounds[index].scoreInThisRound[0])
        teams[1].recordResult(result: rounds[index].scoreInThisRound[min(players.count,4) - 1])
    }

    mutating func deleteRoundRecord(index: Int) {
        for i in 0 ... players.count - 1 {
            
            for j in 0 ... players.count - 1 {
                let roundPlayerNumber = min(rounds[index].players.count-1, i)
                if players[j].id == rounds[index].players[roundPlayerNumber].id {
                    players[j].cancelResult(result: rounds[index].scoreInThisRound[i])
                    decreaseScoreSoFar(index: j, score: rounds[index].scoreInThisRound[i].toInt())
                }
            }
        }
        teams[0].cancelResult(result: rounds[index].scoreInThisRound[0])
        teams[1].cancelResult(result: rounds[index].scoreInThisRound[min(players.count,4) - 1])
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
