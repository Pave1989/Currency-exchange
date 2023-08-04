//
//  RateServiceSpy.swift
//  Exchange StoryboardTests
//
//  Created by Павел Галкин on 26.07.2023.
//

import Foundation
@testable import Exchange_Storyboard

final class RateServiceMock: RateServiceProtocol {

    
    var inputDate = "2000 10 20"
    var executeCalled = false
    var result: Result<MoneyModel, Error>?
    
    func getUSD(date: String, completion: @escaping (Result<MoneyModel, Error>) -> Void) {
        executeCalled = true
        inputDate = date
        result.map(completion)
    }
    
    func getEUR(date: String, completion: @escaping (Result<MoneyModel, Error>) -> Void) {
        executeCalled = true
        inputDate = date
        result.map(completion)
    }
}

final class RateServiseProtocolSpy {
   
   var catchedDateArray = "someData"
   var catchedUSD = "someUSDvalue"
   var catchedEUR = "someEURvalue"
   var catchedError = NetworkingError.invalidData
}

extension RateServiseProtocolSpy: RateViewInput {
    
   func showDate(date: String) {
       
       catchedDateArray = date
   }
   
   func showUSD(usd: String) {
       catchedUSD = usd
   }
   
   func showEUR(eur: String) {
       
       catchedEUR = eur
   }
   
   func showError(error: String) {
       
       catchedError = NetworkingError.invalidData
   }
}
