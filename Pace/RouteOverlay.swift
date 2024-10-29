import SwiftUI

struct RouteOverlay: View {
    var body: some View {
        Path { path in
            // Sample path; replace with actual route data
            path.move(to: CGPoint(x: 100, y: 100))
            path.addLine(to: CGPoint(x: 200, y: 200))
            path.addLine(to: CGPoint(x: 150, y: 300))
        }
        .stroke(Color.accentColor, lineWidth: 3)
    }
}
