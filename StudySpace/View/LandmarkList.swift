import Foundation
import SwiftUI


struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    @State private var searchText = ""


    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var searchResults: [Landmark] {
            if searchText.isEmpty {
                return filteredLandmarks
            } else {
                return filteredLandmarks.filter { $0.name.contains(searchText) }
            }
        }

        var body: some View {
            NavigationView {
                
                NavigationStack {
                    List {
                        Toggle(isOn: $showFavoritesOnly) {
                            Text("Favorites only")
                        }

                        ForEach(searchResults) { landmark in
                            NavigationLink {
                                LandmarkDetail(landmark: landmark)
                            } label: {
                                LandmarkRow(landmark: landmark)
                            }
                        }
                    }
                    .animation(.default, value: searchResults)
                    .navigationTitle("Study Spaces")
                }
                .searchable(text: $searchText)
                Text("Select a Landmark")
            }
           
            
        }
}


#Preview {
    LandmarkList()
        .environment(ModelData())
}

