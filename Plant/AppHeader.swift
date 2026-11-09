import SwiftUI

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
#Preview {
    AppHeader().preferredColorScheme(.dark)
}
