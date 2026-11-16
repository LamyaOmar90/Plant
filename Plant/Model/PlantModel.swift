import Foundation
//مكتبه ابل للاشياء العامه ممثل UUID


// شكل النبتة: كل نبتة عندها هذي المعلومات
//identifiable = uinq id for each one
struct Plant: Identifiable {
    let id = UUID()
    var name: String
    var room: String
    var light: String
    var wateringDays: String
    var water: String
    var isDone = false
}

// الخيارات الثابته اللي تظهر في القوائم
//enum يستخدم للقراءه فقط مابغا اسوي منه اكستنشن
enum PlantOptions {
    static let rooms = ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"]
    static let lights = ["Full sun", "Partial sun", "Low light"]
    static let days = ["Every day", "Every 2 days", "Every 3 days", "Once a week"]
    static let waters = ["20-50 ml", "50-100 ml", "100-200 ml"]
}
