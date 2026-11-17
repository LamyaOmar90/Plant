import SwiftUI

// الألوان
extension Color {
    static let plantGreen = Color(red: 0.25, green: 0.55, blue: 0.45)
    static let cardGray = Color(white: 0.17)
    static let sheetGray = Color(white: 0.11)
    static let sunYellow = Color(red: 0.85, green: 0.82, blue: 0.55)
    static let waterBlue = Color(red: 0.65, green: 0.90, blue: 0.95)
}

// ستايل الكارد الرمادي
extension View {
    func cardStyle() -> some View {
        self
            .padding(.horizontal, 16)
            .background(Color.cardGray)
            .clipShape(RoundedRectangle(cornerRadius: 22))
    }
}

// حجم الخط الموحد لصفحة الإضافة
extension Font {
    static let formText = Font.system(size: 15)
}
