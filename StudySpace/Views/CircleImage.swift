//
//  CircleImage.swift
//  StudySpot
//
//  Created by Grace Hines on 1/27/24.
//

import SwiftUI
struct CircleImage: View {
    var body: some View {
        Image("cathy")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.gray, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}


#Preview {
    CircleImage()
}
