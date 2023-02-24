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
            let teams = ["Manchester Nunited", "Manchester City", "Liverpool",
                         "Arsenal",
                         "HotSpur",
                         "Chelsea",
                         "Paris Saint-Germain",
                         "AS Monaco",
                         "Inter Milano",
                         "AC Milan",
                         "Juventus (Piemonte BN)",
                         "Lazio",
                         "Roma",
                         "Napoli",
                         "Real Madrid",
                         "Barcelona",
                         "Madrid Rosas",
                         "Bayern Munich",
                         "Atletico Mineiro (Brasil)",
                         "Flamengo",
                         "River Plate"
            ]
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

