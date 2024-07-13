import SwiftUI


struct ContentView: View {
    var body: some View {
        ZStack{
            LandmarkList()
            Image("Pitt")
                .resizable()
                .frame(width: 80, height: 45)
                .offset(x:130,y: -400)
        }
    }
}


#Preview {
    ContentView()
        .environment(ModelData())
}
