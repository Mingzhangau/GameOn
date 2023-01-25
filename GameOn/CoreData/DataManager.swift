//
//  DataManager.swift
//  GameOn
//
//  Created by Ming Zhang on 20/1/2023.
//

import Foundation
import CoreData

class DataManager: NSObject, ObservableObject {
    
    let container: NSPersistentContainer = NSPersistentContainer(name: "GameOnModel")
    
    override init() {
        super.init()
        container.loadPersistentStores { _, _ in }
    }
}
