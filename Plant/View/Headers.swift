import SwiftUI

// عنوان "My Plants" اللي فوق
struct AppHeader: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("My Plants 🌱")
                .font(.title)
                .bold()
            Divider()
        }
        .padding(.horizontal)
    }
}

// شريط التقدم في صفحة اليوم
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

#Preview("AppHeader") {
    AppHeader()
        .preferredColorScheme(.dark)
}

#Preview("ProgressHeader") {
    ProgressHeader(done: 2, total: 4)
        .preferredColorScheme(.dark)
}
