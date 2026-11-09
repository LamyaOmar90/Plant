import SwiftUI

// صفحة تذكيرات اليوم + السحب للحذف + الضغط للتعديل
struct PlantsListView: View {
    @Binding var plants: [Plant]
    @State private var selectedPlant: Plant?

    // عدد النباتات اللي انسقت
    var doneCount: Int {
        plants.filter { $0.isDone }.count
    }

    var body: some View {
        VStack {
            ProgressHeader(done: doneCount, total: plants.count)

            List {
                ForEach($plants) { $plant in
                    PlantRow(plant: $plant, onEdit: { selectedPlant = plant })
                        .listRowBackground(Color.black)
                        .swipeActions {
                            Button(role: .destructive) {
                                deletePlant(plant)
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                }
            }
            .listStyle(.plain)
        }
        .sheet(item: $selectedPlant) { plant in
            SetReminderView(plants: $plants, plantToEdit: plant)
        }
    }

    // دالة الحذف
    func deletePlant(_ plant: Plant) {
        plants.removeAll { $0.id == plant.id }
    }
}
#Preview {
    PlantsListView(plants: .constant([
        Plant(name: "Monstera", room: "Kitchen", light: "Full sun", wateringDays: "Every day", water: "20-50 ml"),
        Plant(name: "Pothos", room: "Bedroom", light: "Full sun", wateringDays: "Every day", water: "20-50 ml")
    ]))
    .preferredColorScheme(.dark)
}
