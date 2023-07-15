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
    private var currentDays = 0.0
    private var lastDays = 1.0
    
    init(
         interactor: DateTableViewInteractorInput,
         router: DateTableViewRouterOutput) {
            self.interactor = interactor
            self.router = router
    }
}

extension DateTableViewPresenter: DateTableViewOutput {

    func viewDidLoad() {
        
        interactor.loadDate(days: self.currentDays)
    }
    func didTapCell(dateTap: String) {
        
        router.openRate(for: dateTap)
    }
    func fetchNext() {
        currentDays = currentDays - 30
        if !isLastPage(){
            viewDidLoad()
        }else{
            print("Error view")
        }
    }
    func refresh(){
        currentDays = 1
        viewDidLoad()
    }
    func isFirstPage() -> Bool {
        return currentDays == 1
    }
    func isLastPage() -> Bool {
        return currentDays == lastDays
    }
}

extension DateTableViewPresenter:
    DateTableViewInteractorOutput {
    
    func didRecevie(error: String) {
        
        view?.showError(error: error)
    }
    
    func didLoad(dates: [String], availableDays: Double) {
        lastDays = availableDays
        view?.showDate(dates: dates)
    }
    
//    func didLoadMore(moreDates: [String]) {
//        
//        view?.addDates(date: moreDates)
//    }
}


