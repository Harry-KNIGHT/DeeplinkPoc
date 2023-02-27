//
//  DeeplinkPocApp.swift
//  DeeplinkPoc
//
//  Created by Elliot Knight on 12/02/2023.
//

import SwiftUI

@main
struct DeeplinkPocApp: App {
    
    @State var deeplinkTarget: DeeplinkManager.DeeplinkTarget?
    @State private var presentedNums = [Int]()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $presentedNums) {
                ContentView()
                    .navigationDestination(for: Int.self) { num in
                        NumberDetailView(number: Number(number: num))
                    }
            }
            .onOpenURL { url in
                
                deeplinkTarget = DeeplinkManager().manage(url)
                                
                if let deeplinkTarget {
                    
                    switch deeplinkTarget {
                        
                    case.details(reference: let value):
                                                                        
                        if let intVal = Int(value) {
                            presentedNums.append(intVal)
                        }
                        
                    default: return
                        
                    }
                }
            }
            .environmentObject(AddNumbers())
        }
    }
}
