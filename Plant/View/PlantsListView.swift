import SwiftUI

// صفحة تذكيرات اليوم
struct PlantsListView: View {
    @ObservedObject var viewModel: PlantViewModel

    var body: some View {
        VStack {
            ProgressHeader(done: viewModel.doneCount, total: viewModel.plants.count)

            List {
                ForEach(viewModel.plants) { plant in
                    PlantRow(plant: plant, viewModel: viewModel)
                        .listRowBackground(Color.black)
                        .swipeActions {
                            Button(role: .destructive) {
                                viewModel.deletePlant(plant)
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    PlantsListView(viewModel: PlantViewModel())
        .preferredColorScheme(.dark)
}
