import Foundation
import Combine

final class PlantViewModel: ObservableObject {

    // النباتات كلها
    @Published var plants: [Plant] = []

    // هل المستخدم شاف صفحة البداية؟ (تنحفظ في الجوال)
    @Published var hasSeenOnboarding = false {
        didSet {
            UserDefaults.standard.set(hasSeenOnboarding, forKey: "hasSeenOnboarding")
        }
    }

    // هل صفحة الإضافة / التعديل مفتوحة؟
    @Published var showSheet = false

    // النبتة اللي نعدلها (nil يعني إضافة نبتة جديدة)
    @Published var selectedPlant: Plant? = nil

    // حقول صفحة الإضافة / التعديل
    @Published var name = ""
    @Published var room = "Bedroom"
    @Published var light = "Full sun"
    @Published var days = "Every day"
    @Published var water = "20-50 ml"

    // الخيارات اللي تظهر في القوائم
    let roomOptions = ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"]
    let lightOptions = ["Full sun", "Partial sun", "Low light"]
    let dayOptions = ["Every day", "Every 2 days", "Every 3 days", "Once a week"]
    let waterOptions = ["20-50 ml", "50-100 ml", "100-200 ml"]

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
        for plant in plants {
            if plant.isDone == false {
                return false
            }
        }
        return true
    }

    // هل نعدل نبتة موجودة؟
    var isEditing: Bool {
        return selectedPlant != nil
    }

    // أول ما يشتغل الـ ViewModel نقرأ البيانات المحفوظة
    init() {
        hasSeenOnboarding = UserDefaults.standard.bool(forKey: "hasSeenOnboarding")
        loadFromPhone()
    }

    // نخلص صفحة البداية ونفتح صفحة الإضافة
    func finishOnboarding() {
        hasSeenOnboarding = true
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
        saveToPhone()
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
        saveToPhone()
    }

    // نغير حالة النبتة بين انسقت / ما انسقت
    func toggleDone(_ plant: Plant) {
        for i in 0..<plants.count {
            if plants[i].id == plant.id {
                plants[i].isDone = !plants[i].isDone
            }
        }
        saveToPhone()
    }

    // نحفظ النباتات في الجوال
    private func saveToPhone() {
        if let data = try? JSONEncoder().encode(plants) {
            UserDefaults.standard.set(data, forKey: "savedPlants")
        }
    }

    // نقرأ النباتات من الجوال
    private func loadFromPhone() {
        if let data = UserDefaults.standard.data(forKey: "savedPlants") {
            if let saved = try? JSONDecoder().decode([Plant].self, from: data) {
                plants = saved
            }
        }
    }
}
