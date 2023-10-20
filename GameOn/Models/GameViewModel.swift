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
            Team(id: "Manchester Nunited", isInOptions: true),


            Team(id: "Arsenal", isInOptions: true),

            Team(id: "Paris Saint-Germain", isInOptions: true),

            Team(id: "Inter Milano", isInOptions: true),
            Team(id: "AC Milan", isInOptions: true),
            Team(id: "Lazio", isInOptions: true),
            Team(id: "Roma", isInOptions: true),
            Team(id: "Napoli", isInOptions: true),

            Team(id: "Barcelona", isInOptions: true),

            Team(id: "Bayern Munich", isInOptions: true),

            Team(id: "Germany", isInOptions: true),
            Team(id: "England", isInOptions: true),
            Team(id: "Holland", isInOptions: true),
            
            Team(id: "France", isInOptions: true),
            Team(id: "Italian", isInOptions: true),
            Team(id: "Croatia", isInOptions: true),
            Team(id: "Spanish", isInOptions: true),
            Team(id: "Portugal", isInOptions: true),
            Team(id: "Argentina", isInOptions: true)

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
