import Foundation
import SwiftUI


struct Calender: View {
    @State private var dates: Set<DateComponents> = []
    var body: some View {
        ZStack
        {
            Image("Background")
                .resizable()
                .ignoresSafeArea(edges:.top)
                .ignoresSafeArea(edges:.bottom)
            MultiDatePicker(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, selection: $dates)
        }
    }
}

struct Calender_Previews: PreviewProvider {
    static var previews: some View {
        Calender()
    }
}
