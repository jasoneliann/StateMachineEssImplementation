//
//  EmailNormalCell.swift
//  StateMachine
//
//  Created by Jason Elian on 14/11/20.
//

import SwiftUI

enum EditingState {
    case selected
    case unselected
    case normal
    // TODO: - 5. Add Flag State
    case flag
}

struct EmailCell: View {
    
    struct Content {
        let titleDesc: TitleDescView.Content
        let timestamp: Date
        var state: EditingState
    }
    
    enum DayType {
        case today
        case yesterday
        case inThisWeek
        // TODO: - 9. Add On The WeekEnd State
        case onTheWeekEnd
        case other
        
        static
        func getCurrentDayType(date: Date) -> DayType {
            if Calendar.current.isDateInToday(date) {
                return .today
            }
            // TODO: - 10. Check On The WeekEnd Condition
            else if Calendar.current.isDateInWeekend(date) {
                return onTheWeekEnd
            }
            else if Calendar.current.isDateInYesterday(date) {
                return .yesterday
            } else if date >= (Date() - minusDays(manyDays: 7)) {
                return .inThisWeek
            } else {
                return .other
            }
        }
    }
    
    var content: Content
    
    var body: some View {
        HStack {
            
            switch content.state {
            case .selected:
                Image(systemName: "checkmark.circle.fill")
                
            case .unselected:
                Image(systemName: "circlebadge")
                
            case .normal:
                EmptyView()
                
            // TODO: - 6. Add The State Flag State
            case .flag:
                Image(systemName: "flag.fill")
            }
            
            TitleDescView(content: content.titleDesc)
            Spacer()
            Text(dateFormat)
                .font(.caption)
                .foregroundColor(Color.gray)
            
        }
    }
}

extension EmailCell {
    private
    func convertToDateFormat(timestamp: Date, type: DayType) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        
        switch type {
        case .today:
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: timestamp)
            
        case .yesterday:
            return "Yesterday"
            
        case .inThisWeek:
            dateFormatter.dateFormat = "EEEE"
            return dateFormatter.string(from: timestamp)
            
        // TODO: 11. Add On The WeekEnd String
        case .onTheWeekEnd:
            return "WEEKEND"
                                    
        case .other:
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return dateFormatter.string(from: timestamp)
        }
    }
    
    private
    var dateFormat: String {
        let dayType: DayType = DayType.getCurrentDayType(
            date: self.content.timestamp
        )
        return convertToDateFormat(
            timestamp: self.content.timestamp,
            type: dayType
        )
    }
}

struct EmailNormalCell_Previews: PreviewProvider {
    
    @State static var cellContent = EmailCell.Content(
        titleDesc: TitleDescView.Content(
            title: "Title",
            desc: "Desc"
        ),
        timestamp: Date(),
        state: .unselected
    )
    
    static var previews: some View {
        EmailCell(
            content: cellContent
        )
    }
}
