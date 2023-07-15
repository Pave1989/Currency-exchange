//
//  DateTableViewInteractor.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 20.06.2023.
//

import Foundation

final class DateTableViewInteractor:  DateTableViewInteractorInput {
    
    weak var output: DateTableViewInteractorOutput?
    var datesServise = DateService()

    func loadDate(days: Double) {
        
        datesServise.getData(fetchDays: days) {
            [weak self] result in
            switch result {
            case.success(let data):
                self?.output?.didLoad(dates: data, availableDays: days)
            case.failure(_):
                let error = "данные отсутствуют"
                self?.output?.didRecevie(error: error)
            }
        }
    }
}
