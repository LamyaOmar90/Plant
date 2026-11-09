import SwiftUI

// صفحة الإضافة + التعديل (نفس الصفحة)
struct SetReminderView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var plants: [Plant]
    var plantToEdit: Plant? = nil      // إذا nil يعني إضافة، وإذا فيه نبتة يعني تعديل

    @State private var name = ""
    @State private var room = "Bedroom"
    @State private var light = "Full sun"
    @State private var days = "Every day"
    @State private var water = "20-50 ml"

    var body: some View {
        VStack(spacing: 20) {

            // الشريط العلوي
            HStack {
                Button { dismiss() } label: {
                    Image(systemName: "xmark")
                        .padding(10)
                        .background(Color.cardGray)
                        .clipShape(Circle())
                }
                Spacer()
                Text("Set Reminder").font(.footnote).bold()
                Spacer()
                Button { save() } label: {
                    Image(systemName: "checkmark")
                        .padding(10)
                        .background(Color.plantGreen)
                        .clipShape(Circle())
                }
                .disabled(name.isEmpty)
            }

            // اسم النبتة
            HStack {
                Text("Plant Name").font(.footnote)
                TextField("Pothos", text: $name)
            }
            .cardStyle()

            // الغرفة والإضاءة
            VStack {
                SettingRow(icon: "location", title: "Room", options: PlantOptions.rooms, selection: $room)
                Divider()
                SettingRow(icon: "sun.max", title: "Light", options: PlantOptions.lights, selection: $light)
            }
            .cardStyle()

            // أيام السقي والكمية
            VStack {
                SettingRow(icon: "drop", title: "Watering Days", options: PlantOptions.days, selection: $days)
                Divider()
                SettingRow(icon: "drop", title: "Water", options: PlantOptions.waters, selection: $water)
            }
            .cardStyle()

            // زر الحذف يطلع بس في وضع التعديل
            if plantToEdit != nil {
                Button { deleteThisPlant() } label: {
                    Text("Delete Reminder")
                        .font(.footnote)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                        .cardStyle()
                }
            }

            Spacer()
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.sheetGray.ignoresSafeArea())
        .onAppear { loadPlant() }
    }

    // إذا نعدل: نعبي الحقول بمعلومات النبتة
    func loadPlant() {
        guard let plant = plantToEdit else { return }
        name = plant.name
        room = plant.room
        light = plant.light
        days = plant.wateringDays
        water = plant.water
    }

    // حفظ: تعديل أو إضافة
    func save() {
        if let plant = plantToEdit,
           let index = plants.firstIndex(where: { $0.id == plant.id }) {
            plants[index].name = name
            plants[index].room = room
            plants[index].light = light
            plants[index].wateringDays = days
            plants[index].water = water
        } else {
            let newPlant = Plant(name: name, room: room, light: light, wateringDays: days, water: water)
            plants.append(newPlant)
            NotificationManager.schedule(for: newPlant)
        }
        dismiss()
    }

    // حذف النبتة
    func deleteThisPlant() {
        plants.removeAll { $0.id == plantToEdit?.id }
        dismiss()
    }
}
#Preview {
    SetReminderView(plants: .constant([]))
        .preferredColorScheme(.dark)
}
