//
//  Date.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import Foundation

extension Date {
    init(seconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(seconds))
    }
    
    func getHour(date : Date) -> Int {return Calendar.current.component(.hour, from: date) }
    
    func getHourWithAmPm(date: Date) ->(hour :String, shift : String, formatTime: String){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        let currentDateStr = formatter.string(from: date)
        let component = currentDateStr.components(separatedBy: ":")[0]
        if currentDateStr.contains("AM"){
            return (component,"AM",currentDateStr)
        }else{
            return (component,"PM",currentDateStr)
        }
    }
    
    func getDayName(date: Date)-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayInWeek = dateFormatter.string(from: date)
        return dayInWeek
    }
}
