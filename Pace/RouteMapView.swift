
import SwiftUI
import MapKit

struct RouteMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.334_900, longitude: -122.009_020),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )

    var workoutSummary = WorkoutSummary(
        avgPace: "7'24''/km",
        distance: "4.52 km",
        time: "24:29",
        elevation: "12 m",
        calories: "580 kcal",
        bpm: "120 bpm"
    )

    var body: some View {
        VStack {
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: .constant(.follow))
                .overlay(RouteOverlay(), alignment: .center)
                .edgesIgnoringSafeArea(.top)

            WorkoutSummaryView(summary: workoutSummary)
                .padding()

            MusicPlayerView()
                .padding(.horizontal)
        }
        .background(Color("BackgroundColor").edgesIgnoringSafeArea(.all))
    }
}

struct WorkoutSummary {
    var avgPace: String
    var distance: String
    var time: String
    var elevation: String
    var calories: String
    var bpm: String
}

struct WorkoutSummaryView: View {
    var summary: WorkoutSummary

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Workout Summary")
                .font(.headline)
                .foregroundColor(.white)
            HStack {
                SummaryItem(title: "Avg Pace", value: summary.avgPace)
                Spacer()
                SummaryItem(title: "Distance", value: summary.distance)
            }
            HStack {
                SummaryItem(title: "Time", value: summary.time)
                Spacer()
                SummaryItem(title: "Elevation", value: summary.elevation)
            }
            HStack {
                SummaryItem(title: "Calories", value: summary.calories)
                Spacer()
                SummaryItem(title: "BPM", value: summary.bpm)
            }
        }
        .padding()
        .background(Color("CardColor"))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct SummaryItem: View {
    var title: String
    var value: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(value)
                .font(.headline)
                .foregroundColor(.white)
        }
    }
}

struct MusicPlayerView: View {
    var body: some View {
        HStack {
            Image("albumArt") // Replace with your album art image name
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)

            VStack(alignment: .leading) {
                Text("Running Playlist")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("Artist Name")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            HStack {
                Button(action: {}) {
                    Image(systemName: "backward.fill")
                        .foregroundColor(.white)
                        .font(.title2)
                }
                Button(action: {}) {
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .font(.title2)
                }
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                        .foregroundColor(.white)
                        .font(.title2)
                }
            }
        }
        .padding()
        .background(Color("CardColor"))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}
