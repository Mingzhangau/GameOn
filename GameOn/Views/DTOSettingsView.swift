//
//  DTOSettingsView.swift
//  GameOn
//
//  Created by Ming Zhang on 17/2/2023.
//

import SwiftUI

struct DTOSettingsView: View {
    
    
    var body: some View {
        
        NavigationView {
            

            
            ScrollView {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    
                HStack {
                    PlayerDTOListView()
                    TeamDTOListView()
                }

                Button(action: {
                    startNewGame()

                }) {
                    Text("Game on")
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

            .navigationTitle("Let's game")
            .navigationBarTitleDisplayMode(.inline)


        }
        .navigationViewStyle(StackNavigationViewStyle())

    }
}

private extension DTOSettingsView {
    func startNewGame() {

    }
}

//struct DTOSettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DTOSettingsView()
//    }
//}
