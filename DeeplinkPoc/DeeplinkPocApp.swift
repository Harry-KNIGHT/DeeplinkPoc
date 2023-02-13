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

	var body: some Scene {
		WindowGroup {
			Group {
				switch self.deeplinkTarget {
				case .home:
					ContentView()
				case .details(let queryInfo):
					NumberDetailView(number: Number(number: 6))
				case .none:
					ContentView()
				}
			}
			.onOpenURL { url in
				let deeplinkManager = DeeplinkManager()
				let deeplink = deeplinkManager.manage(url)
				self.deeplinkTarget = deeplink
			}
			.environmentObject(AddNumbers())
		}
	}
}
