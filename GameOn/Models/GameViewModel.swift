//
//  GameViewModel.swift
//  GameOn
//
//  Created by Ming Zhang on 11/1/2023.
//

import Foundation

extension SettingsView {
    class ViewModel: ObservableObject {
        @Published
        var currentGame: Game? = nil

        @Published
        var teams: [Team] = [
            Team(id: "Brasil", isInOptions: true),
            Team(id: "Argentina", isInOptions: true),
            Team(id: "Germany", isInOptions: true),
            Team(id: "France", isInOptions: true),
            Team(id: "Netherlands", isInOptions: true),
            Team(id: "Croatia", isInOptions: true),
            Team(id: "England", isInOptions: true),
            Team(id: "Morocco", isInOptions: true),
            Team(id: "Portugal", isInOptions: true),
            Team(id: "Australia", isInOptions: true),
            Team(id: "Japan", isInOptions: true),
//            Team(id: "Senegal", isInOptions: true),
            Team(id: "Spain", isInOptions: true),
            Team(id: "Bayern Munich", isInOptions: true),
//            Team(id: "Real Madrid", isInOptions: true),
            Team(id: "Barcelona", isInOptions: true),
            Team(id: "Manchester United", isInOptions: true),
//            Team(id: "Manchester City", isInOptions: true),
        ]

        @Published
        var players: [Player] = [
            Player(stringLiteral: "Ming"),
            Player(stringLiteral: "Joel"),
            Player(stringLiteral: "James"),
            Player(stringLiteral: "Chang"),
            Player(id: "Tommy", isInOptions: false),
        ]
    }
}
