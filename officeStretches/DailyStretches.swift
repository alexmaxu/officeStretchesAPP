//
//  DailyStretches.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct DailyStretches: View {
    let title: String
    let image: ImageResource
    var body: some View {
        VStack (spacing: 16){
            Text(title)
                .font(.title)
                .bold()
                .padding(.top)
                
            Image(image)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.horizontal)
                
                
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    DailyStretches(title: "Routine", image: .ejercise1)
}