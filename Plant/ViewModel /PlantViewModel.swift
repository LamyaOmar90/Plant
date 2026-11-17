import Foundation
import Combine

final class PlantViewModel: ObservableObject {
//كلمة @Published تعني: "كل ما تتغير هذي القيمة، أخبري كل صفحة تستخدمها"
    
    // النباتات كلها
    @Published var plants: [Plant] = []

    // هل شاف المستخدم صفحة البداية؟
    @Published var hasSeenOnboarding = false

    // هل صفحة الإضافة / التعديل مفتوحة؟
    @Published var showSheet = false

    // النبتة اللي نعدلها (nil يعني إضافة جديدة)
    @Published var selectedPlant: Plant? = nil

    // حقول صفحة الإضافة / التعديل
    @Published var name = ""
    @Published var room = "Bedroom"
    @Published var light = "Full sun"
    @Published var days = "Every day"
    @Published var water = "20-50 ml"

    // عدد النباتات اللي انسقت
    var doneCount: Int {
        var count = 0
        for plant in plants {
            if plant.isDone {
                count = count + 1
            }
        }
        return count
    }

    // هل كل النباتات انسقت؟
    var allDone: Bool {
        return doneCount == plants.count
    }

    // هل نعدل نبتة موجودة؟
    var isEditing: Bool {
        return selectedPlant != nil
    }

    // أول ما يشتغل نقرأ: هل شاف صفحة البداية قبل؟
    init() {
        hasSeenOnboarding = UserDefaults.standard.bool(forKey: "hasSeenOnboarding")
    }

    // نخلص صفحة البداية ونفتح صفحة الإضافة
    func finishOnboarding() {
        hasSeenOnboarding = true
        UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")
        startAdding()
    }

    // نفتح صفحة الإضافة بحقول فاضية
    func startAdding() {
        selectedPlant = nil
        name = ""
        room = "Bedroom"
        light = "Full sun"
        days = "Every day"
        water = "20-50 ml"
        showSheet = true
    }

    // نفتح صفحة التعديل ونعبي الحقول بمعلومات النبتة
    func startEditing(_ plant: Plant) {
        selectedPlant = plant
        name = plant.name
        room = plant.room
        light = plant.light
        days = plant.wateringDays
        water = plant.water
        showSheet = true
    }

    // نحفظ: تعديل نبتة موجودة أو إضافة نبتة جديدة
    func savePlant() {
        if let plant = selectedPlant {
            for i in 0..<plants.count {
                if plants[i].id == plant.id {
                    plants[i].name = name
                    plants[i].room = room
                    plants[i].light = light
                    plants[i].wateringDays = days
                    plants[i].water = water
                }
            }
        } else {
            let newPlant = Plant(name: name, room: room, light: light, wateringDays: days, water: water)
            plants.append(newPlant)
            NotificationManager.schedule(for: newPlant)
        }
        showSheet = false
    }

    // نحذف النبتة اللي نعدلها (من صفحة التعديل)
    func deleteSelectedPlant() {
        if let plant = selectedPlant {
            deletePlant(plant)
        }
        showSheet = false
    }

    // نحذف نبتة معينة (من السحب في القائمة)
    func deletePlant(_ plant: Plant) {
        for i in 0..<plants.count {
            if plants[i].id == plant.id {
                plants.remove(at: i)
                break
            }
        }
    }

    // نغير حالة النبتة بين انسقت / ما انسقت
    func toggleDone(_ plant: Plant) {
        for i in 0..<plants.count {
            if plants[i].id == plant.id {
                plants[i].isDone = !plants[i].isDone
            }
        }
    }
}
