import SwiftUI

// أول صفحة: تطلع مرة وحدة بس
struct OnboardingView: View {
    @ObservedObject var viewModel: PlantViewModel

    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            PlantImage()
            Text("Start your plant journey!")
                .font(.headline)
            Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            Spacer()
            PrimaryButton(title: "Set Plant Reminder") {
                viewModel.finishOnboarding()
            }
        }
        .padding()
    }
}

#Preview {
    OnboardingView(viewModel: PlantViewModel())
        .preferredColorScheme(.dark)
}
