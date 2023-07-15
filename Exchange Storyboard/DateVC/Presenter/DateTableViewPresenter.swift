//
//  DateTableViewPresenter.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 20.06.2023.
//

import Foundation

final class DateTableViewPresenter {
    
    weak var view: DateTableViewInput?
    var interactor: DateTableViewInteractorInput
    var router: DateTableViewRouterOutput
    
    init(
         interactor: DateTableViewInteractorInput,
         router: DateTableViewRouterOutput) {
            self.interactor = interactor
            self.router = router
    }
}

extension DateTableViewPresenter: DateTableViewOutput {
  
    func viewDidLoad() {
        
        interactor.loadDate()
    }
    func didTapCell(dateTap: String) {
        
        router.openRate(for: dateTap)
    }
    func addMonth(month: Double) {
        interactor.loadMonth(month: month)
    }
}

extension DateTableViewPresenter:
    DateTableViewInteractorOutput {
    
    func didRecevie(error: String) {
        
        view?.showError(error: error)
    }
    
    func didLoad(dates: [String]) {
        
        view?.showDate(date: dates)
    }
    
    func didLoadMore(moreDates: [String]) {
        
        view?.addDates(date: moreDates)
    }
}


