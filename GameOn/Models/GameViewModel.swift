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
            Team(id: "Manchester City", isInOptions: true),
            Team(id: "Liverpool", isInOptions: true),
            Team(id: "Arsenal", isInOptions: true),
            Team(id: "HotSpur", isInOptions: true),
            Team(id: "Chelsea", isInOptions: true),
            Team(id: "Paris Saint-Germain", isInOptions: true),
            Team(id: "AS Monaco", isInOptions: true),
            Team(id: "Inter Milano", isInOptions: true),
            Team(id: "AC Milan", isInOptions: true),
            Team(id: "Juventus (Piemonte BN)", isInOptions: true),
            Team(id: "Lazio", isInOptions: true),
            Team(id: "Roma", isInOptions: true),
            Team(id: "Napoli", isInOptions: true),
            Team(id: "Real Madrid", isInOptions: true),
            Team(id: "Barcelona", isInOptions: true),
            Team(id: "Madrid Rosas", isInOptions: true),
            Team(id: "Bayern Munich", isInOptions: true),

            Team(id: "Atletico Mineiro (Brasil)", isInOptions: true),
            Team(id: "Flamengo", isInOptions: true),
            Team(id: "River Plate", isInOptions: true)
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
