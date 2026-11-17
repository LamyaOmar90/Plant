import SwiftUI

// الصفحة الرئيسية: تقرر أي صفحة تطلع
struct ContentView: View {
    @StateObject private var viewModel = PlantViewModel()

    var body: some View {
        ZStack(alignment: .bottomTrailing) {

            VStack(alignment: .leading) {
                AppHeader()

                if viewModel.hasSeenOnboarding == false {
                    OnboardingView(viewModel: viewModel)
                } else if viewModel.plants.isEmpty {
                    EmptyPlantsView()
                } else if viewModel.allDone {
                    AllDoneView()
                } else {
                    PlantsListView(viewModel: viewModel)
                }
            }

            // زر (+) يطلع بعد صفحة البداية
            if viewModel.hasSeenOnboarding {
                PlusButton {
                    viewModel.startAdding()
                }
                .padding()
            }
        }
        .foregroundColor(.white)
        .background(Color.black.ignoresSafeArea())
        .sheet(isPresented: $viewModel.showSheet) {
            SetReminderView(viewModel: viewModel)
        }
        .onAppear {
            NotificationManager.askPermission()
        }
    }
}

#Preview {
    ContentView()
}
