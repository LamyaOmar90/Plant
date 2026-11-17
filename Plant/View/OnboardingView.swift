import SwiftUI

// أول صفحة: تطلع مرة وحدة بس
struct OnboardingView: View {
    @ObservedObject var viewModel: PlantViewModel

    var body: some View {
        VStack(spacing: 28) {
            PlantImage()
                .padding(.top, 70)
            Text("Start your plant journey!")
                .font(.headline)
            Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            PrimaryButton(title: "Set Plant Reminder") {
                viewModel.finishOnboarding()
            }
            .frame(width: 300)
            .padding(.top, 70)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    OnboardingView(viewModel: PlantViewModel())
        .preferredColorScheme(.dark)
}
