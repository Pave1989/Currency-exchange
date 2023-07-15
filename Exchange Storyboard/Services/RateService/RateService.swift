//
//  RateService.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation
//import Alamofire
// MARK: - декомпозировать сетевой слой
class RateService: RateServiceProtocol {
    
//    private enum NeedCurrency {
//        static let rubles = "RUB"
//        static let dollar = "USD"
//        static let euro = "EUR"
//    }
//    private let baseURL = "https://api.currencyapi.com/v3/historical"
//    private let key = "brSDcfXhHXOJ7JbXOE0KRzRR5CxBR5s2HkUg3c01"
////MARK: - decoder
//    private let decoder: JSONDecoder = {
//       let decoder = JSONDecoder()
//       decoder.keyDecodingStrategy = .convertFromSnakeCase
//
//        return decoder
//    }()
//MARK: Get Dollar
    func getUSD(date1: String, completion: @escaping (Result <MoneyModel?, Error>) -> Void) {

        guard let getURL = URL(string: "https://api.currencyapi.com/v3/historical?apikey=brSDcfXhHXOJ7JbXOE0KRzRR5CxBR5s2HkUg3c01&date=\(date1)&base_currency=USD&currencies=RUB") else {
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
    
    // Если работать с Alamofire то:
//    func getUSD(date1: String,completion: @escaping (Result<MoneyModel?, Error>) -> Void) {
//
//        let parameters = ["apikey": key,
//                        "date": date1,
//                        "base_currency": NeedCurrency.dollar,
//                        "currencies": NeedCurrency.rubles]
//
//        AF.request(baseURL, method: .get, parameters: parameters).responseDecodable(of: MoneyModel.self, decoder: decoder) { response in
//            switch response.result {
//            case .success(let value):
//                completion(.success(value))
//            case .failure(let error):
//                print(error)
//        }
//    }
//}
    
//MARK: Get Euro 

    func getEUR(date1: String, completion: @escaping (Result <MoneyModel?, Error>) -> Void) {
        
        guard let getURL = URL(string: "https://api.currencyapi.com/v3/historical?apikey=brSDcfXhHXOJ7JbXOE0KRzRR5CxBR5s2HkUg3c01&date=\(date1)&base_currency=EUR&currencies=RUB") else {
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
