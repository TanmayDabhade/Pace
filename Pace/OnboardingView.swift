
import SwiftUI

struct OnboardingView: View {
    @State private var navigateToDashboard = false

    var body: some View {
        ZStack {
            Image("backgroundImage") // Replace with your background image name
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )

            VStack {
                Spacer()
                Text("Start Your Running Journey")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Text("Take your first step toward a healthier, more active lifestyle & help you reach your running goals.")
                    .font(.body)
                    .foregroundColor(Color.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding()

                Button(action: {
                    withAnimation {
                        navigateToDashboard = true
                    }
                }) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .scaleEffect(navigateToDashboard ? 1.05 : 1.0)
                }
             
                .padding(.bottom, 50)
                .scaleEffect(navigateToDashboard ? 1.05 : 1.0)
                .animation(.easeInOut(duration: 0.2), value: navigateToDashboard)

                NavigationLink(
                    destination: DashboardView(),
                    isActive: $navigateToDashboard,
                    label: { EmptyView() }
                )
            }
        }
        .padding(.leading)
        .padding(.trailing)
        .navigationBarHidden(true)
    }
}
