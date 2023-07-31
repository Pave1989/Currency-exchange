//
//  NetworkService.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 26.07.2023.
//

import Foundation

class NetworkService: NetworkServiceProtocol {
    func request(urlString: String, queryItems: [URLQueryItem]?, completion: @escaping (Data?, Error?) -> Void) {
        // URLSession.shared.dataTask
        //Alamofire
        //Moya
    }
}
