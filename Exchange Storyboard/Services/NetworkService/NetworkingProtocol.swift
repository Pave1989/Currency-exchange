//
//  NetworkServiceProtocol.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 26.07.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    
    func request(urlString: String, queryItems: [URLQueryItem]?, completion: @escaping(Data?, Error?) -> Void)
}
