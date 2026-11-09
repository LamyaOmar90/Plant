import SwiftUI

struct TagView: View {
    var icon: String
    var text: String

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
            Text(text)
        }
        .font(.caption2)
        .foregroundColor(.gray)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color.cardGray)
        .clipShape(Capsule())
    }
}
#Preview {
    TagView(icon: "drop", text: "20-50 ml").preferredColorScheme(.dark)
}
