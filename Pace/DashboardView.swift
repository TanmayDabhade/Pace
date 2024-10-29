
import SwiftUI

struct DashboardView: View {
    @State private var userName: String = "Alex"
    @State private var distanceCovered: Double = 10.24
    @State private var distanceIncrease: Double = 5.4
    @State private var dailySteps: Int = 8451
    @State private var heartRate: Int = 124
    @State private var caloriesBurned: Int = 580
    @State private var weeklyCalories: [Double] = [400, 450, 500, 550, 580, 600, 620]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Good work for today, \(userName) 🔥")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()

                    DistanceCard(
                        distance: distanceCovered,
                        increase: distanceIncrease
                    )
                    .padding(.horizontal)

                    MetricsCard(
                        steps: dailySteps,
                        heartRate: heartRate,
                        calories: caloriesBurned,
                        weeklyCalories: weeklyCalories
                    )
                    .padding(.horizontal)
                }
            }
            .background(Color("BackgroundColor").edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
        }
    }
}

struct DistanceCard: View {
    var distance: Double
    var increase: Double

    var body: some View {
        VStack(alignment: .leading) {
            Text("Distance Covered")
                .font(.headline)
                .foregroundColor(.gray)
            HStack {
                Text("\(String(format: "%.2f", distance)) km")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                Text("Increase \(String(format: "%.1f", increase))%")
                    .foregroundColor(.green)
            }
        }
        .padding()
        .background(Color("CardColor"))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct MetricsCard: View {
    var steps: Int
    var heartRate: Int
    var calories: Int
    var weeklyCalories: [Double]

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                MetricItem(iconName: "figure.walk", value: "\(steps)", unit: "steps")
                Spacer()
                MetricItem(iconName: "heart.fill", value: "\(heartRate)", unit: "bpm")
            }
            .padding(.bottom)

            Text("Calories Burned")
                .font(.headline)
                .foregroundColor(.gray)

            BarChartView(data: weeklyCalories)
                .frame(height: 150)
        }
        .padding()
        .background(Color("CardColor"))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct MetricItem: View {
    var iconName: String
    var value: String
    var unit: String

    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.orange)
                .font(.title)
            VStack(alignment: .leading) {
                Text(value)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(unit)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
