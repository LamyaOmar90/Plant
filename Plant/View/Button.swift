import SwiftUI

// الزر الأخضر الكبير glassy
struct PrimaryButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.footnote)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                
        }
        .buttonStyle(.glassProminent)
        .buttonBorderShape(.capsule)
        .tint(.plantGreen)
    }
}

// زر + الدائري glassy
struct PlusButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 32, height: 32)
                
        }
        .buttonStyle(.glassProminent)
        .buttonBorderShape(.circle)
        .tint(.plantGreen)
    }
}

// زر دائري صغير (X والصح في صفحة الإضافة) glassy
struct CircleIconButton: View {
    var icon: String
    var color: Color
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: 15))
                .foregroundColor(.white)
                .frame(width: 28, height: 28)
                
        }
        .buttonStyle(.glassProminent)
        .buttonBorderShape(.circle)
        .tint(color)
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

#Preview("CircleIconButton") {
    HStack(spacing: 20) {
        CircleIconButton(icon: "xmark", color: .cardGray) { }
        CircleIconButton(icon: "checkmark", color: .plantGreen) { }
    }
    .preferredColorScheme(.dark)
}
