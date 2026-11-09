import SwiftUI

struct PlantImage: View {
    var body: some View {
        // بدليها بصورة النبتة من فيجما: Image("plant")
        Image(systemName: "leaf.circle.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 120, height: 120)
            .foregroundColor(.plantGreen)
    }
}
#Preview {
    PlantImage().preferredColorScheme(.dark)
}
