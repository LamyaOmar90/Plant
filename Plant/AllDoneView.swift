import SwiftUI

// لما كل النباتات تنسقى
struct AllDoneView: View {
    var body: some View {
        VStack(spacing: 10) {
            PlantImage()
            Text("All Done! 🎉")
                .font(.headline)
            Text("All Reminders Completed")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
