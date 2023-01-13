//
//  TeamListView.swift
//  GameOn
//
//  Created by Ming Zhang on 11/1/2023.
//

import SwiftUI

struct TeamListView: View {
    @Binding
    var viewModel: [Team]
    @State
    var newTeamName: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("Choose Teams:").font(.headline)
            ForEach(viewModel.indices, id: \.self) { index in
                HStack {
                    Text(viewModel[index].name)
                    Toggle("", isOn: $viewModel[index].isInOptions)
                }
            }
            TextField("Enter new team name", text: $newTeamName)
            Button(action: {
                viewModel.append(Team(id: newTeamName, isInOptions: true))
                newTeamName = ""
            }) {
                Image(systemName: "plus.circle")
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
    }
}

// struct TeamListView_Previews: PreviewProvider {
//    static var previews: some View {
//        TeamListView()
//    }
// }
