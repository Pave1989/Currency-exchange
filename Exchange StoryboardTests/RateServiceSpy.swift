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
   
   var catchedDateArray: String = "someData"
   var catchedUSD: String = "someUSDvalue"
   var catchedEUR: String = "someEURvalue"
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
//
//final class RateServiceStub: RateServiceProtocol {
//    
//    func getUSD(date: String, completion: @escaping (Result<MoneyModel, Error>) -> Void) {
//        let modelMoney = try! JSONDecoder().decode(MoneyModel.self, from: Data())
//        completion(.success(modelMoney))
//    }
//    
//    func getEUR(date: String, completion: @escaping (Result<MoneyModel, Error>) -> Void) {
//        let modelMoney = try! JSONDecoder().decode(MoneyModel.self, from: Data())
//        completion(.success(modelMoney))
//    }
//}
//
//final class RateServiceSpy: RateServiceProtocol {
//    // выполнить заглушку
//    var performStub: ((Int, (Result<MoneyModel, Error>) -> Void) -> Void)?
//    // загрузить заглушку
//    var downloadStub: ((Int, (Result<URL, Error>) -> Void) -> Void)?
//    
//    func getUSD(date: String, completion: @escaping (Result<MoneyModel, Error>) -> Void) {
//        if let completion = completion as? (Result<MoneyModel, Error>) -> Void {
//             performStub?(1, completion)
//             return
//         }
//    }
//    
//    func getEUR(date: String, completion: @escaping (Result<MoneyModel, Error>) -> Void) {
//        if let completion = completion as? (Result<MoneyModel, Error>) -> Void {
//             performStub?(1, completion)
//             return
//    }
//  }
//}
