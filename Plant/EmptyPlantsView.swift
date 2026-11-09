import SwiftUI

// الصفحة الفاضية: بعد أول استخدام وما فيه نباتات
struct EmptyPlantsView: View {
    var body: some View {
        Text("No reminders set yet..")
            .font(.caption)
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
#Preview {
    EmptyPlantsView().preferredColorScheme(.dark)
}
