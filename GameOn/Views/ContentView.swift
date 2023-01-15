//
//  ContentView.swift
//  GameOn
//
//  Created by Ming Zhang on 10/1/2023.
//

import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    // MARK: Lifecycle

    init(viewModel: ViewModel) {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = .white
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance

        UINavigationBar.appearance().tintColor = UIColor(.accentColor)

        self.viewModel = viewModel
    }

    // MARK: Internal

    @ObservedObject
    var viewModel: ViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)

                HStack {
                    PlayerListView(viewModel: $viewModel.players)
                    TeamListView(viewModel: $viewModel.teams)
                }

                Button(action: {
                    startNewGame()
                    showGameView = true

                }) {
                    Text("Game on")
                }
            }

            .navigationTitle("Let's game")
            .navigationBarTitleDisplayMode(.inline)

            .sheet(isPresented: $showGameView) {
                GameDetailsView(viewModel: $viewModel.currentGame)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    // MARK: Private

    @State
    private var showGameView = false
}

private extension ContentView {
    func startNewGame() {
        let playersInGame = viewModel.players.filter {
            $0.isInOptions
        }
        let teamsInGame = viewModel.teams.filter {
            $0.isInOptions
        }
        viewModel.currentGame = Game(
            players: playersInGame,
            teams: teamsInGame
        )
        viewModel.currentGame?.startNewRound()
    }
}

// struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
// }
