//
//  DeeplinkPocApp.swift
//  DeeplinkPoc
//
//  Created by Elliot Knight on 12/02/2023.
//

import SwiftUI

@main
struct DeeplinkPocApp: App {
    
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
                
                let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
                
                if let urlComponents {
                    
                    if url.pathComponents.contains("number") {
                        
                        if let queryItems = urlComponents.queryItems {
                            
                            for query in queryItems {
                                
                                if let value = query.value {
                                    
                                    if let numValue = Int(value) {
                                        
                                        presentedNums.append(numValue)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .environmentObject(AddNumbers())
        }
    }
}
