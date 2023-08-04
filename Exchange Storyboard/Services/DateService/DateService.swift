//
//  DateService.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation
import UIKit

class DateService: DateServiceProtocol {

    func getData(fetchDays: Int, complition: @escaping (Result<[String], Error>) -> Void) {
        
        var dates = [String]()
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd MMMM yyyy"
        
        //для операций со сложением/вычитанием времени(дни, месяцы, годы)
        var past = DateComponents()
        past.month = -1 //минус один месяц в прошлое
        
        let date = Date()
        let dateStart = Calendar.current.startOfDay(for: date)
        var dateNow = dateStart + (60*60*24)
        dateNow = dateNow - TimeInterval((60*60*24) * fetchDays) //вычитаем приходящее значение(дни)
        print("CurrentDay: \(dateNow)")
        print("DeductionDays: \(fetchDays)")
        //для того чтобы указать тип календаря(григарианский или другой)
        let calendar = Calendar.current
        let lastDate = calendar.date(byAdding: past, to: dateNow)
        
        var dayAgoComponent = DateComponents()
        dayAgoComponent.day = -1 //вычитаем по дню
        
        while (dateNow != lastDate) {
            dateNow = calendar.date(byAdding: dayAgoComponent, to: dateNow)!
            dates.append(dateFormater.string(from: dateNow))
        }
            complition(.success(dates))
            print(dates)
    }
}
