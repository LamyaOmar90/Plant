import SwiftUI

// صورة النبتة (من Assets)
struct PlantImage: View {
    var name = "Plantpic"

    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .frame(width: 160, height: 160)
    }
}

#Preview {
    PlantImage()
        .preferredColorScheme(.dark)
}
