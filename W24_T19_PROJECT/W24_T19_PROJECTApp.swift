//
//  W24_T19_PROJECTApp.swift
//  W24_T19_PROJECT
//
//  Created by Divine Falola on 2024-04-17.
//

import SwiftUI

@main
struct W24_T19_PROJECTApp: App {
    let persistenceController = PersistenceController.shared
    
    @State private var showContentView = false

    var body: some Scene {
        WindowGroup {
            
            if showContentView {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            } else {
                LaunchScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                self.showContentView = true
                        }
                    }
                }
            }
        }
    }
}
