//
//  RateService.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation

class RateService: RateServiceProtocol {
    
// Get Dollar
    func getUSD(date: String, completion: @escaping (Result <MoneyModel, Error>) -> Void) {

        guard let getURL = URL(string: "https://api.currencyapi.com/v3/historical?apikey=brSDcfXhHXOJ7JbXOE0KRzRR5CxBR5s2HkUg3c01&date=\(date)&base_currency=USD&currencies=RUB") else {
            completion(.failure(NetworkingError.badUrl))
            return
        }
        var request = URLRequest(url: getURL)
        request.httpMethod = "GET"
        let session = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                completion(.failure(NetworkingError.badRequest))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let modelMoney = try decoder.decode(MoneyModel.self, from: data)
                completion(.success(modelMoney))
            } catch {
                completion(.failure(NetworkingError.invalidData))
            }
        }
        session.resume()
    }
    
// Get Euro

    func getEUR(date: String, completion: @escaping (Result <MoneyModel, Error>) -> Void) {
        
        guard let getURL = URL(string: "https://api.currencyapi.com/v3/historical?apikey=brSDcfXhHXOJ7JbXOE0KRzRR5CxBR5s2HkUg3c01&date=\(date)&base_currency=EUR&currencies=RUB") else {
            completion(.failure(NetworkingError.badUrl))
            return
        }
        var request = URLRequest(url: getURL)
        request.httpMethod = "GET"
        let session = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                completion(.failure(NetworkingError.badRequest))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let modelMoney = try decoder.decode(MoneyModel.self, from: data)
                completion(.success(modelMoney))
            } catch {
                completion(.failure(NetworkingError.invalidData))
            }
        }
        session.resume()
    }
}
