//
//  PlayerDTOListView.swift
//  GameOn
//
//  Created by Ming Zhang on 20/1/2023.
//

import SwiftUI
import CoreData

struct PlayerDTOListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: PlayerDTO.entity(), sortDescriptors: [NSSortDescriptor(key: "id", ascending: true)]) private var players: FetchedResults<PlayerDTO>
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Choose Players:").font(.headline)

            ForEach(players) { player in
                HStack {
                    Label(
                        player.id,
                        systemImage: "circle\(player.isInOptions ? ".fill" : "")"
                    )
                    .frame(width: 300, alignment: .leading)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        player.isInOptions = !player.isInOptions
                        try? viewContext.save()
                    }
                    Label(
                        "",
                        systemImage: "trash.fill"
                    )
                    .frame(width: 50, alignment: .trailing)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        deletePlayer(player: player)
                    }
                }

                
            }
            
            Button(action: {
                addPlayer()

            }) {
                Text("Add Player")
            }

        }
        .padding()
        .background(Color.gray.opacity(0.1))
    }
}

extension PlayerDTOListView {
    private func deletePlayers(indexSet: IndexSet) {
        for index in indexSet {
            viewContext.delete(players[index])
        }
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
    
    private func deletePlayer(player: PlayerDTO) {
        viewContext.delete(player)
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
    
    /// Add a new item
    private func addPlayer() {
        presentTextInputAlert(title: "Add Player", message: "Enter Play name") { name in
            ///-> remove this line manager.todoItems.append(TodoItem(task: name))
            let newPlayer = PlayerDTO(context: viewContext)
            newPlayer.id = name
            newPlayer.isInOptions = true
            try? viewContext.save()
        }
    }
}

// struct PlayerDTOListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerDTOListView()
//    }
// }
