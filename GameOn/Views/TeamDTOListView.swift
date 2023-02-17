//
//  TeamDTOListView.swift
//  GameOn
//
//  Created by Ming Zhang on 30/1/2023.
//

import SwiftUI
import CoreData

struct TeamDTOListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: TeamDTO.entity(), sortDescriptors: [NSSortDescriptor(key: "id", ascending: true)]) private var teams: FetchedResults<TeamDTO>
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                preSetTeams()

            }) {
                Text("Preset Teams")
            }
            
            Text("Choose Teams:").font(.headline)

            ForEach(teams) { team in
                HStack {
                    Label(
                        team.id,
                        systemImage: "circle\(team.isInOptions ? ".fill" : "")"
                    )
                    .frame(width: 300, alignment: .leading)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        team.isInOptions = !team.isInOptions
                        try? viewContext.save()
                    }
                    Label(
                        "",
                        systemImage: "trash.fill"
                    )
                    .frame(width: 50, alignment: .trailing)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        deleteTeam(team: team)
                    }
                }

                
            }
            
            Button(action: {
                addTeam()

            }) {
                Text("Add Team")
            }

        }
        .padding()
        .background(Color.gray.opacity(0.1))
    }
}

extension TeamDTOListView {
    private func deleteTeams(indexSet: IndexSet) {
        for index in indexSet {
            viewContext.delete(teams[index])
        }
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
    
    private func deleteTeam(team: TeamDTO) {
        viewContext.delete(team)
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
    
    /// Add a new item
    private func addTeam() {
        presentTextInputAlert(title: "Add Team", message: "Enter team name") { name in
            DTOAddTeam(name: name)
        }
    }
    
    private func DTOAddTeam(name: String) {
        if !teams.map(\.id).contains(name) {
            let newTeam = TeamDTO(context: viewContext)
            newTeam.id = name
            newTeam.isInOptions = true
            try? viewContext.save()
        }
    }
    
    private func preSetTeams() {
            let teams = ["Brasil", "Argentina", "Germany", "France", "Netherlands", "Croatia", "England", "Morocco", "Portugal", "Australia", "Japan", "Spain", "Bayern Munich", "Barcelona", "Manchester United"]
        for team in teams {
            DTOAddTeam(name: team)
        }
    }
}

// struct TeamDTOListView_Previews: PreviewProvider {
//    static var previews: some View {
//        TeamDTOListView()
//    }
// }

