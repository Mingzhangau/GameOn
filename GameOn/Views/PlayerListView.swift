//
//  PlayerListView.swift
//  GameOn
//
//  Created by Ming Zhang on 11/1/2023.
//

import SwiftUI

struct PlayerListView: View {
    @Binding
    var viewModel: [Player]
    @State
    var newPlayerName: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("Choose Players:").font(.headline)
            ForEach(viewModel.indices, id: \.self) { index in
                HStack {
                    Text(viewModel[index].name)
                    Toggle("", isOn: $viewModel[index].isInOptions)
                }
            }
            TextField("Enter new player name", text: $newPlayerName)
            Button(action: {
                viewModel.append(Player(stringLiteral: newPlayerName))
                newPlayerName = ""
            }) {
                Image(systemName: "plus.circle")
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
    }
}

// struct PlayerListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerListView()
//    }
// }
