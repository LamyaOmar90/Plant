import SwiftUI

// سطر الإعدادات (الغرفة، الإضاءة...)
struct SettingRow: View {
    var icon: String
    var title: String
    var options: [String]
    @Binding var selection: String   // القيمة الأصلية عند الأب

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
            Text(title)
            Spacer()

            // قائمة منسدلة أصلية من Apple
            Menu {
                Picker(title, selection: $selection) {
                    ForEach(options, id: \.self) { option in
                        Text(option).tag(option)
                    }
                }
            } label: {
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
    SettingRow(icon: "location", title: "Room", options: PlantOptions.rooms, selection: .constant("Bedroom"))
        .padding()
        .preferredColorScheme(.dark)
}
