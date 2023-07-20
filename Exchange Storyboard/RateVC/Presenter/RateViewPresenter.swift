//
//  RatePresenter.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation

final class RateViewPresenter {
    
    weak var view: RateViewInput?
    var router: RateViewRouterInput
    var interactor: RateViewInteractorInput

    init(interactor: RateViewInteractorInput, router: RateViewRouterInput) {
        self.interactor = interactor
        self.router = router
    }
}

extension RateViewPresenter: RateViewOutput {
    
    func viewDidLoad() {
        interactor.loadEuro()
        interactor.loadDollar()
        let date = interactor.dateVC
        view?.showDate(date: date)
    }
}

extension RateViewPresenter: RateViewInteractorOutput {
    
    func didRecevie(error: String) {
        view?.showError(error: error)
    }
 
    func didLoadUSD(usdResult: String) {
        view?.showUSD(usd: usdResult)
    }
    
    func didLoadEUR(eurResult: String) {
        view?.showEUR(eur: eurResult)
    }
}
