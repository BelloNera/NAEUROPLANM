import SwiftUI

extension View{
    @ViewBuilder
    func hSpacing(_ alignment: Alignment) -> some View{
        self.frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func vSpacing(_ alignment: Alignment) -> some View{
        self.frame(maxHeight: .infinity, alignment: alignment)
    }///content to the top, bottom, or center

    func isSameDate(_ date1: Date,_ date2: Date) -> Bool{
        return Calendar.current.isDate(date1, inSameDayAs: date2)
    }//dates on the same day
}

