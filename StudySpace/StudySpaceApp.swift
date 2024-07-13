import SwiftUI
import SwiftData

@main
struct StudySpaceApp: App {
    @State private var modelData = ModelData()


        var body: some Scene {
            WindowGroup {
                ContentView()
                    .environment(modelData)
            }
        }
}
