//
//  icaloriesApp.swift
//  icalories
//
//  Created by Henrique wagner on 01/05/22.
//

import SwiftUI

@main
struct icaloriesApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
