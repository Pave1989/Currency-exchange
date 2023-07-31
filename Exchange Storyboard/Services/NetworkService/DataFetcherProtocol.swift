//
//  DataFetcherProtocol.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 26.07.2023.
//

import Foundation

protocol DataFetcherProtocol {
    // URLQueryItem - Одна пара "имя-значение" из части запроса URL-адреса.
    func fetcherGenericJSONData<T: Decodable>(url: String, queryItems: [URLQueryItem]?, responce: @escaping(T?) -> Void)
}
