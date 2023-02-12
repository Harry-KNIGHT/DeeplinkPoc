//
//  ContentView.swift
//  DeeplinkPoc
//
//  Created by Elliot Knight on 12/02/2023.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var numberVM = AddNumbers()
	var body: some View {
		NavigationStack {
			List(numberVM.numbers) { number in
				NavigationLink(destination: NumberDetailView(number: number)) {
					Text(String(number.number))
				}
			}
		}
		.onAppear {
			numberVM.creatNumbers()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.environmentObject(AddNumbers())
	}
}

struct Number: Identifiable {
	var id = UUID()
	let number: Int
}


class AddNumbers: ObservableObject {
	@Published var numbers = [Number]()
	
	func creatNumbers() {
		for number in 0...100 {
			numbers.append(Number(number: number))
		}
	}
}
