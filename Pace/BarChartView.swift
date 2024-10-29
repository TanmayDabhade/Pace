
import SwiftUI

struct BarChartView: View {
    var data: [Double]

    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            ForEach(data.indices, id: \.self) { index in
                BarView(value: data[index], maxValue: data.max() ?? 1)
            }
        }
    }
}

struct BarView: View {
    var value: Double
    var maxValue: Double

    var body: some View {
        VStack {
            Spacer()
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.accentColor)
                .frame(height: CGFloat(value / maxValue) * 150)
        }
    }
}
