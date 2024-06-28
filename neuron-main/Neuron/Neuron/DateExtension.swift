import SwiftUI


extension Date{
    
    func format(_ format : String) -> String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
    var isToday: Bool{
        return Calendar.current.isDateInToday(self )
    }
    
    var  isSameHour: Bool
    {
        return Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedSame
    }
    var  isPast: Bool
    {
        return Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedSame
    }
    
    
    // date gives the week
    func fetchWeek(_ date: Date = .init()) -> [WeekDay]
    {
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: date)
        
        var week: [WeekDay] = []
        let weekDate = calendar.dateInterval(of: .weekOfMonth, for: startDate)
        
        guard let startWeek = weekDate?.start else
        {
            return []
        }
        
        //iteration to get the full week
        (0..<7).forEach{index in
            if let weekDay = calendar.date(byAdding: .day, value: index, to: startDate){
                week.append(.init(date: weekDay))
            }
        }
        return week
        
    }
    /*
    func createNextWeek() -> [WeekDay]
    {
        let calendar = Calendar.current
        let startOfLastDate = calendar.startOfDay(for: self)
        guard let nextDate = calendar.date(byAdding: .day,value: 1, to: startOfLastDate)
        else{
            return []
        }
        return fetchWeek(nextDate)
        
    }
    
    
    func createPreviousWeek()-> [WeekDay]
    {
        let calendar = Calendar.current
        let startOfNextDate = calendar.startOfDay(for: self)
        guard let previousDate = calendar.date(byAdding: .day,value: -1, to: startOfNextDate)
        else{
            return []
        }
        return fetchWeek(previousDate)
        
    }

    */
    
    func createNextWeek() -> [WeekDay]
    {
        let calendar = Calendar.current
        let startOfLastDate = calendar.startOfDay(for: self)
        guard let nextDate = calendar.date(byAdding: .day, value: 1, to: startOfLastDate) 
        else{
            return []
        }
        return fetchWeek(nextDate)
    }

    func createPreviousWeek()-> [WeekDay]
    {
        let calendar = Calendar.current
        let startOfNextDate = calendar.startOfDay(for: self)
        guard let previousDate = calendar.date(byAdding: .day, value: -7, to: startOfNextDate) // Subtract 7 days
        else{
            return []
        }
        return fetchWeek(previousDate)
    }
    
    
   
    
    struct WeekDay: Identifiable{
        var id: UUID = .init()
        var date: Date
    }
}
