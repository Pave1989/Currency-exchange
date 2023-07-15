//
//  RateInteractor.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation

final class RateViewInteractor: RateViewInteractorInput{
    
    weak var output: RateViewInteractorOutput?
    let rateService = RateService()
    let convertDateService = ConvertDateFormatService()
    let errorData = "данные отсутствуют"
    var dateVC: String
    
    init(dateVC: String){
        self.dateVC = dateVC
    }
//MARK: - получение доллара
    func loadDollar() {
        
        let convertDate = convertDateService.convertDateFormat(inputDate: dateVC) 
        rateService.getUSD(date1: convertDate) {  [weak self] dateUSD in
           
            switch dateUSD {
            case .success(let model):
                guard let dollar = model?.data?.rub?.value else {
                    print(NetworkingError.invalidData)
                    let error = self!.errorData                // ???
                    self?.output?.didRecevie(error: error)
                    return
                }
                self?.output?.didLoadUSD(usdResult: dollar)
            case .failure(let error):
                print(error)
            }
        }
    }
//MARK: - получение евро
    func loadEuro() {
        
        let convertDate = convertDateService.convertDateFormat(inputDate: dateVC)
        rateService.getEUR(date1: convertDate) { [weak self] dateEUR in
            
            switch dateEUR {
            case .success(let model):
                guard let euro = model?.data?.rub?.value else {
                    print(NetworkingError.invalidData)
                    let error = "данные отсутствуют"
                    self?.output?.didRecevie(error: error)
                    return
                }
                self?.output?.didLoadEUR(eurResult: euro)
            case .failure(let error):
                print(error)
            }
        }
    }
}
