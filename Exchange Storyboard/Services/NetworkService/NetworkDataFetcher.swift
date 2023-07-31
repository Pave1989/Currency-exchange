//
//  NetworkDataFetcher.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 26.07.2023.
//

import Foundation

class NetworkDataFetcher: DataFetcherProtocol {
    
    var networking: NetworkServiceProtocol
    
    init(networking: NetworkServiceProtocol = NetworkService()) {
        self.networking = networking
    }
    
    func fetcherGenericJSONData<T>(url: String, queryItems: [URLQueryItem]?, responce: @escaping (T?) -> Void) where T : Decodable {
        // авторизация
        // общая ошибка
    }
}
