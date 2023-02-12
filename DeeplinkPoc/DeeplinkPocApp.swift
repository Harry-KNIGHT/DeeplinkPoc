//
//  DeeplinkPocApp.swift
//  DeeplinkPoc
//
//  Created by Elliot Knight on 12/02/2023.
//

import SwiftUI

@main
struct DeeplinkPocApp: App {
	var body: some Scene {
		WindowGroup {
			ContentView()
				.onOpenURL { url in
					print(url)
				}
		}
	}
}
