//
//  GameDetailsView.swift
//  GameOn
//
//  Created by Ming Zhang on 13/1/2023.
//

import SwiftUI

// MARK: - GameDetailsView

struct GameDetailsView: View {
    @Binding
    var viewModel: Game?
    @Environment(\.presentationMode)
    var mode: Binding<PresentationMode>

    var body: some View {
        if let viewModel = viewModel {
            NavigationView {
                VStack {
                    Text("Scores so far")
                    HStack {
                        ForEach(viewModel.players.indices, id: \.self) { index in
                            Text(viewModel.players[index].name + "    ")
                        }
                    }

                    HStack {
                        ForEach(viewModel.scoresSoFar.indices, id: \.self) { index in
                            Text(String(viewModel.scoresSoFar[index]) + "    ")
                        }
                    }

                    List {
                        ForEach(viewModel.rounds.indices, id: \.self) {
                            index in
                            RoundCellView(viewModel: viewModel.rounds[index], roundIndex: index)
                        }
                        .onDelete {
                            indexSet in
                            deleteRound(indexSet: indexSet)
                        }
                    }

                    Button("New round") {
                        startNewRound()
                    }
                }

                .navigationBarItems(leading: Button(action: {
                    self.mode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                })

                .navigationTitle("Game record")
                .navigationBarBackButtonHidden(false)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

extension GameDetailsView {
    private func startNewRound() {
        viewModel?.startNewRound()
    }

    private func deleteRound(indexSet: IndexSet) {
        viewModel?.deleteRound(indexSet: indexSet)
    }
}

// struct GameDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameDetailsView()
//    }
// }
