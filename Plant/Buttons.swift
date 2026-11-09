import SwiftUI

// الزر الأخضر الكبير
struct PrimaryButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.plantGreen)
                .clipShape(Capsule())
        }
    }
}

// زر + الدائري
struct PlusButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
                .background(Color.plantGreen)
                .clipShape(Circle())
        }
    }
}

#Preview("PrimaryButton") {
    PrimaryButton(title: "Set Plant Reminder") { }
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("PlusButton") {
    PlusButton { }
        .preferredColorScheme(.dark)
}
