//
//  ContentView.swift
//  GameOn
//
//  Created by Ming Zhang on 10/1/2023.
//

import SwiftUI
import CoreData

// MARK: - ContentView

struct ContentView: View {
    // MARK: Lifecycle

    init() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = .white
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance

        UINavigationBar.appearance().tintColor = UIColor(.accentColor)

        }

    // MARK: Internal

    
    @EnvironmentObject var manager: DataManager
    @Environment(\.managedObjectContext) private var viewContext


    var body: some View {
        TabView {
            SettingsView(viewModel: SettingsView.ViewModel())
                .tabItem {
                    Label("OldSettings", systemImage: "list.dash")
                }

            DTOSettingsView()
                .tabItem {
                    Label("NewSettings", systemImage: "square.and.pencil")
                }
        }
    }
}

// struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
// }

extension View {
    // MARK: - Present UIAlertController with a text field
    func presentTextInputAlert(title: String, message: String, completion: @escaping (_ text: String) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField()
        let submitAction = UIAlertAction(title: "Save", style: .default) { _ in
            if let text = alert.textFields?.first?.text, !text.isEmpty {
                completion(text)
            }
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(submitAction)
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
    }
}
