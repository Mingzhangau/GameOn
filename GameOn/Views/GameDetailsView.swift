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
                            VStack {
                                Text(viewModel.players[index].name + "    ")
                                Text(String(viewModel.players[index].gameRecord.gamePlayed) + "    ")

                                Text(String(viewModel.scoresSoFar[index]) + "")
                            }
                        }
                    }

                    List {
                        ForEach(viewModel.rounds.indices, id: \.self) {
                            index in
                            RoundCellView(
                                viewModel: viewModel.rounds[index],
                                game: $viewModel,
                                roundIndex: index
                            )
                        }
                        .onDelete {
                            indexSet in
                            deleteRound(indexSet: indexSet)
                        }
                    }

                    Button("New round") {
                        startNewRound()
                    }
                    .frame(width: 200, height: 100)
                    .font(.largeTitle)
                    .background(
                      ZStack {
                          RoundedRectangle(cornerRadius: 21.0).fill( LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom))
                      }
                    )
                    .overlay(
                      RoundedRectangle(cornerRadius: 21.0)
                        .strokeBorder(Color.red, lineWidth: 2.0)
                    )
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
