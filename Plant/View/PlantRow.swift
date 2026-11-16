import SwiftUI

// سطر النبتة في القائمة
struct PlantRow: View {
    let plant: Plant
    @ObservedObject var viewModel: PlantViewModel

    var body: some View {
        HStack(alignment: .center, spacing: 12) {

            // دائرة الإنجاز
            Button {
                viewModel.toggleDone(plant)
            } label: {
                Image(systemName: plant.isDone ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundColor(plant.isDone ? .plantGreen : .gray)
            }
            .buttonStyle(.plain)

            // معلومات النبتة: الغرفة، الاسم، الكبسولات
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    Image(systemName: "location")
                    Text("in \(plant.room)")
                }
                .font(.caption2)
                .foregroundColor(.gray)

                Text(plant.name)
                    .font(.title3)

                HStack(spacing: 6) {
                    TagView(icon: "sun.max", text: plant.light, color: .sunYellow)
                    TagView(icon: "drop", text: plant.water, color: .waterBlue)
                }
            }
            .onTapGesture {
                viewModel.startEditing(plant)
            }
        }
        .padding(.vertical, 6)
    }
}

// الكبسولة الصغيرة (الإضاءة / الماء)
struct TagView: View {
    var icon: String
    var text: String
    var color: Color

    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: icon)
            Text(text)
        }
        .font(.caption)
        .foregroundColor(color)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Color.cardGray.opacity(0.8))
        .clipShape(RoundedRectangle(cornerRadius: 9))
    }
}

#Preview("PlantRow") {
    PlantRow(
        plant: Plant(name: "Monstera", room: "Kitchen", light: "Full sun", wateringDays: "Every day", water: "20-50 ml"),
        viewModel: PlantViewModel()
    )
    .padding()
    .background(Color.black)
    .preferredColorScheme(.dark)
}
