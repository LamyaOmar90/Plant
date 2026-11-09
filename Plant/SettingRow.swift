import SwiftUI

struct SettingRow: View {
    var icon: String
    var title: String
    var options: [String]
    @Binding var selection: String   // القيمة الأصلية عند الأب

    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(title)
            Spacer()
            Picker(title, selection: $selection) {
                ForEach(options, id: \.self) { option in
                    Text(option).tag(option)
                }
            }
            .pickerStyle(.menu)
            .tint(.gray)
        }
        .font(.footnote)
        .padding(.vertical, 6)
    }
}
#Preview {
    SettingRow(icon: "location", title: "Room", options: PlantOptions.rooms, selection: .constant("Bedroom"))
        .padding()
        .preferredColorScheme(.dark)
}
