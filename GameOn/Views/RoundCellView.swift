//
//  RoundCellView.swift
//  GameOn
//
//  Created by Ming Zhang on 13/1/2023.
//

import SwiftUI

struct RoundCellView: View {
    var viewModel: Round
    @Binding
    var game: Game?
    var roundIndex: Int
    @State
    var homeScore: String = ""
    @State
    var awayScore: String = ""

    var body: some View {
        HStack {
            Text(
                "Round " + String(roundIndex + 1) + ": "
            )
            VStack {
                HStack {
                    ForEach(viewModel.players.indices, id: \.self) { index in
                        VStack {
                            Text(viewModel.players[index].name)

                            if let scoreInThisRound = game?.rounds[roundIndex].scoreInThisRound {
                                if scoreInThisRound != [] {
                                    Text(scoreInThisRound[index].toString())
                                }
                            }
                        }
                    }
                }

                HStack {
                    ForEach(viewModel.teams.indices, id: \.self) { index in
                        Text(viewModel.teams[index].name)
                    }
                }
            }
            .frame(minWidth: 300, idealWidth: 550)
            TextField("Home Score", text: $homeScore)
            TextField("Away Score", text: $awayScore)
            Button(action: {
                if homeScore != "", awayScore != "" {
                    game?.recordRound(
                        index: roundIndex,
                        homeScore: Int(homeScore) ?? 0,
                        awayScore: Int(awayScore) ?? 0
                    )
                }

            }) {
                Image(systemName: "plus.circle")
            }
        }
    }
}

// struct RoundCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        RoundCellView()
//    }
// }
