import SwiftUI

// الألوان اللي نستخدمها في كل الصفحات
extension Color {
    static let plantGreen = Color(red: 0.25, green: 0.55, blue: 0.45)
    static let cardGray = Color(white: 0.17)
    static let sheetGray = Color(white: 0.11)
}

// ستايل الكارد الرمادي (نكتبه مرة وحدة ونستدعيه)
extension View {
    func cardStyle() -> some View {
        self
            .padding()
            .background(Color.cardGray)
            .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}
