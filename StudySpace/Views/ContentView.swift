//
//  ContentView.swift
//  StudySpot
//
//  Created by Grace Hines on 1/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                MapView()
                    .frame(height: 300)
                
                CircleImage()
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                Text("Cathedral of Learning")
                    .font(.title)
                    .multilineTextAlignment(.center)
            }
            
            Divider()


            Text("Where to study here")
                .font(.title2)
            Text("Descriptive text goes here.")
        }
        .padding()
        
        Spacer()
    }
}

#Preview {
    ContentView()
}
