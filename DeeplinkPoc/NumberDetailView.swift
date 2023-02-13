//
//  NumberDetailView.swift
//  DeeplinkPoc
//
//  Created by Elliot Knight on 12/02/2023.
//

import SwiftUI

struct NumberDetailView: View {
	let number: Number
	@EnvironmentObject var numberVM: AddNumbers
    var body: some View {
		Text(number.number.description)
			.font(.largeTitle)
			.fontWeight(.black)
    }
}

struct NumberDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NumberDetailView(number: Number(number: 69))
			.environmentObject(AddNumbers())
    }
}
