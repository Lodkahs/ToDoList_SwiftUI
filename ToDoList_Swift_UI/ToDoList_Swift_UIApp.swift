//
//  ToDoList_Swift_UIApp.swift
//  ToDoList_Swift_UI
//
//  Created by Andrew  on 3/29/23.
//

import SwiftUI

@main
struct ToDoList_Swift_UIApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(listViewModel)
        }
    }
}
