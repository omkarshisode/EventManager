//
//  AppTextView.swift
//  SwiftUIPractice
//
//  Created by Omkar Shisode on 26/01/25.
//

import SwiftUI

struct AppTextView: View {
    var body: some View {
        Text("Hello world!, I am Omkar Shisode that become the one of the best programmer, I am going to build something big.")
            .baselineOffset(10.0)
            .kerning(1.0)
            .multilineTextAlignment(.leading)
            .foregroundColor(.blue)
            .padding(20)
            .frame(width: 200,height: 200, alignment: .center)
            .minimumScaleFactor(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            
    }
}

#Preview {
    AppTextView()
}
