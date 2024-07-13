import Foundation
import SwiftUI


struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark


    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    @State private var date = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2024, month: 1, day: 28)
        let endComponents = DateComponents(year: 2024, month: 04, day: 30, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    
   
    @State private var room: Int = 200
    @State private var showDetails = false
    var body: some View {
        @Bindable var modelData = modelData

        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)


            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)


            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }.padding(4)


                HStack {
                    Text(landmark.park).padding(3)
                    Spacer()
                    Text(landmark.state).padding(3)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)


                Divider()

                DatePicker(
                       "Space Availabality for",
                        selection: $date,
                        in: dateRange,
                       displayedComponents: [.date]
                       ).padding(4)
                Text(landmark.description).padding(4)
                
                VStack {
                            Stepper("Choose a room:                             \(room)", value: $room, in: 200...205)
                        }.padding(4)
                DatePicker(
                       "Choose a time:",
                        selection: $date,
                        in: dateRange,
                       displayedComponents: [.hourAndMinute]
                       ).padding(4)
                
                Button("Submit") {

                }.buttonStyle(.bordered)
                    .padding(5)
                
                Text("*Rooms are booked in one hour intervals.").padding(5)

            }
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}


#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}

