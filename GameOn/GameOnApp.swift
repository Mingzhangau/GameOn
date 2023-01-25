//
//  GameOnApp.swift
//  GameOn
//
//  Created by Ming Zhang on 10/1/2023.
//

import SwiftUI

@main
struct GameOnApp: App {
    @StateObject private var manager: DataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentView.ViewModel())
                .environmentObject(manager)
                .environment(\.managedObjectContext, manager.container.viewContext)
        }
    }
}
