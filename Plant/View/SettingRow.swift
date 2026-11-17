import SwiftUI

// سطر الإعدادات (الغرفة، الإضاءة...)
struct SettingRow: View {
    var icon: String  //الايقونه اللي تطلع يسار
    var title: String  //مثل الموقع والشمس
    var options: [String] //قائمه الخيارات
    @Binding var selection: String   // القيمة  الأصلية عند الأب
//الموجوده في الفيو مودل الROOM
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
            Text(title)
            Spacer()

            // قائمة منسدلة أصلية من Apple
            Menu {
                ForEach(options, id: \.self) { option in
                    Button(option) {
                        selection = option
                    }
                }
            }label: {
                HStack(spacing: 4) {
                    Text(selection)
                    Image(systemName: "chevron.up.chevron.down")
                        .font(.system(size: 10, weight: .semibold))
                }
                .foregroundColor(.gray)
            }
        }
        .font(.formText)
        .padding(.vertical, 14)
    }
}

#Preview {
    SettingRow(icon: "location", title: "Room", options: ["Bedroom", "Kitchen"], selection: .constant("Bedroom"))
        .padding()
        .preferredColorScheme(.dark)
}
