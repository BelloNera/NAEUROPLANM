
import SwiftUI
import SwiftData



@Model
class Task: Identifiable {
    var id : UUID
    var title: String
    var caption: String
    var date: Date
    var isCompleted : Bool
    var tint: String
    
    init(id: UUID = .init() , title: String, caption: String, date: Date = .init() , isCompleted: Bool = false, tint: String) {
        self.id = id
        self.title = title
        self.caption = caption
        self.date = date
        self.isCompleted = isCompleted
        self.tint = tint
    }
    var tintColor: Color
    {
        switch tint {
        case "taskColour1" : return .red
        case "taskColour2" : return .blue
        case "taskColour3" : return .green
        case "taskColour4" : return .purple
        default: return .black
            
    }
        
    }
    
    
}
extension Date
{
    static func updateHour(_ value: Int) -> Date
    {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
    
}

