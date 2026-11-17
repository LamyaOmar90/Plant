
import SwiftUI

struct PlantRow: View {

    let plant: Plant
    @ObservedObject var viewModel: PlantViewModel

    var body: some View {

        HStack(spacing: 12) {

            // زر إكمال المهمة
            Button {
                viewModel.toggleDone(plant)
            } label: {
                Image(systemName: plant.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(plant.isDone ? .plantGreen : .gray)
            }
            .buttonStyle(.plain)

            // معلومات النبتة
            VStack(alignment: .leading, spacing: 5) {

                Text("in \(plant.room)")
                    .font(.caption)
                    .foregroundColor(.gray)

                Text(plant.name)
                    .font(.title3)

                // معلومات الإضاءة والماء
                HStack(spacing: 6) {

                    HStack {
                        Image(systemName: "sun.max")
                        Text(plant.light)
                    }
                    .foregroundColor(.sunYellow)

                    HStack {
                        Image(systemName: "drop")
                        Text(plant.water)
                    }
                    .foregroundColor(.waterBlue)
                }
                .font(.caption)
            }
            .onTapGesture {
                viewModel.startEditing(plant)
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    PlantRow(
        plant: Plant(
            name: "Monstera",
            room: "Kitchen",
            light: "Full sun",
            wateringDays: "Every day",
            water: "20-50 ml"
        ),
        viewModel: PlantViewModel()
    )
    .padding()
    .preferredColorScheme(.dark)
}
