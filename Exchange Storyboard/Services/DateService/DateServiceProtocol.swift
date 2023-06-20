//
//  DateServiceProtocol.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation

protocol DateServiceProtocol {
    
    func getData(complition: @escaping ([String]) -> Void)
}
