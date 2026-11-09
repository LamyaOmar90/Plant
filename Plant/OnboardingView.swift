import SwiftUI

// أول صفحة: تطلع مرة وحدة بس
struct OnboardingView: View {
    @Binding var hasSeenOnboarding: Bool
    @Binding var showAddSheet: Bool

    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            PlantImage()
            Text("Start your plant journey!")
                .font(.headline)
            Text("Now all your plants will be in one place and we will help you take care of them :)")
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            Spacer()
            PrimaryButton(title: "Set Plant Reminder") {
                hasSeenOnboarding = true
                showAddSheet = true
            }
        }
        .padding()
    }
}
#Preview {
    OnboardingView(hasSeenOnboarding: .constant(false), showAddSheet: .constant(false))
        .preferredColorScheme(.dark)
}
