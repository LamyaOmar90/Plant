import SwiftUI

// الصفحة الرئيسية: تقرر أي صفحة تطلع
struct ContentView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @State private var plants: [Plant] = []
    @State private var showAddSheet = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {

            VStack(alignment: .leading) {
                AppHeader()

                if !hasSeenOnboarding {
                    OnboardingView(hasSeenOnboarding: $hasSeenOnboarding, showAddSheet: $showAddSheet)
                } else if plants.isEmpty {
                    EmptyPlantsView()
                } else if plants.allSatisfy({ $0.isDone }) {
                    AllDoneView()
                } else {
                    PlantsListView(plants: $plants)
                }
            }

            // زر + يطلع بعد الصفحة الأولى
            if hasSeenOnboarding {
                PlusButton { showAddSheet = true }
                    .padding()
            }
        }
        .foregroundColor(.white)
        .background(Color.black.ignoresSafeArea())
        .sheet(isPresented: $showAddSheet) {
            SetReminderView(plants: $plants)
        }
        .onAppear { NotificationManager.askPermission() }
    }
}
#Preview {
    ContentView()
}
