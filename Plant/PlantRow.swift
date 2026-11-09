import SwiftUI

struct PlantRow: View {
    @Binding var plant: Plant     // نعدل على النبتة الأصلية
    var onEdit: () -> Void        // وش يصير لما نضغط على الاسم

    var body: some View {
        HStack(alignment: .top, spacing: 12) {

            // دائرة الإنجاز
            Button {
                plant.isDone.toggle()
            } label: {
                Image(systemName: plant.isDone ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundColor(plant.isDone ? .plantGreen : .gray)
            }
            .buttonStyle(.plain)

            // معلومات النبتة
            VStack(alignment: .leading, spacing: 6) {
                Text("in \(plant.room)")
                    .font(.caption2)
                    .foregroundColor(.gray)
                Text(plant.name)
                    .font(.title3)
                HStack {
                    TagView(icon: "sun.max", text: plant.light)
                    TagView(icon: "drop", text: plant.water)
                }
            }
            .onTapGesture { onEdit() }
        }
        .padding(.vertical, 6)
    }
}
#Preview {
    PlantRow(
        plant: .constant(Plant(name: "Monstera", room: "Kitchen", light: "Full sun", wateringDays: "Every day", water: "20-50 ml")),
        onEdit: { }
    )
    .padding()
    .background(Color.black)
    .preferredColorScheme(.dark)
}
