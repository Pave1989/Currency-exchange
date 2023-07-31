//
//  RateServiceProtocol.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation

protocol RateServiceProtocol {
    
    func getUSD(date: String,completion: @escaping (Result<MoneyModel, Error>) -> Void)
    func getEUR(date: String, completion: @escaping (Result<MoneyModel, Error>) -> Void)
}
