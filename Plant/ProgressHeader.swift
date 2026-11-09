import SwiftUI

struct ProgressHeader: View {
    var done: Int
    var total: Int

    var body: some View {
        VStack(spacing: 10) {
            if done == 0 {
                Text("Your plants are waiting for a sip 💦")
            } else {
                Text("\(done) of your plants feel loved today ✨")
            }
            ProgressView(value: Double(done), total: Double(total))
                .tint(.plantGreen)
        }
        .font(.footnote)
        .padding()
    }
}
#Preview {
    ProgressHeader(done: 2, total: 4).preferredColorScheme(.dark)
}
