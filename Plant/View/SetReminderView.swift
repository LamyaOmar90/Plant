import SwiftUI

// صفحة الإضافة + التعديل (نفس الصفحة)
struct SetReminderView: View {
    @ObservedObject var viewModel: PlantViewModel

    var body: some View {
        VStack(spacing: 28) {

            // الشريط العلوي
            HStack {
                CircleIconButton(icon: "xmark", color: .cardGray) {
                    viewModel.showSheet = false
                }
                Spacer()
                Text("Set Reminder")
                    .font(.footnote)
                    .bold()
                Spacer()
                CircleIconButton(icon: "checkmark", color: .plantGreen) {
                    viewModel.savePlant()
                }
                .disabled(viewModel.name.isEmpty)
            }

            // اسم النبتة (كبسولة)
            HStack(spacing: 6) {
                Text("Plant Name")
                TextField("Pothos", text: $viewModel.name)
                    .tint(.plantGreen)
            }
            .font(.formText)
            .padding(.horizontal, 16)
            .padding(.vertical, 18)
            .background(Color.cardGray)
            .clipShape(Capsule())

            // الغرفة والإضاءة
            VStack(spacing: 0) {
                SettingRow(icon: "location", title: "Room", options: viewModel.roomOptions, selection: $viewModel.room)
                Divider().overlay(Color.white.opacity(0.1))
                SettingRow(icon: "sun.max", title: "Light", options: viewModel.lightOptions, selection: $viewModel.light)
            }
            .cardStyle()

            // أيام السقي والكمية
            VStack(spacing: 0) {
                SettingRow(icon: "drop", title: "Watering Days", options: viewModel.dayOptions, selection: $viewModel.days)
                Divider().overlay(Color.white.opacity(0.1))
                SettingRow(icon: "drop", title: "Water", options: viewModel.waterOptions, selection: $viewModel.water)
            }
            .cardStyle()

            // زر الحذف يطلع بس في وضع التعديل
            if viewModel.isEditing {
                Button {
                    viewModel.deleteSelectedPlant()
                } label: {
                    Text("Delete Reminder")
                        .font(.footnote)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.cardGray)
                        .clipShape(Capsule())
                }
            }

            Spacer()
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.sheetGray.ignoresSafeArea())
    }
}

#Preview {
    SetReminderView(viewModel: PlantViewModel())
        .preferredColorScheme(.dark)
}
