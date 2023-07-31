//
//  DateServiceSpy.swift
//  Exchange StoryboardTests
//
//  Created by Павел Галкин on 29.07.2023.
//

import Foundation
@testable import Exchange_Storyboard

final class DateServiseProtocolSpy {
    
    var catchedDateArray: [String] = []
    var catchedError = NetworkingError.invalidData
}
extension DateServiseProtocolSpy: DateTableViewInput {
    
    func showDate(dates: [String]) {
        catchedDateArray = dates
    }
    
    func showError(error: String) {
        catchedError = NetworkingError.invalidData
    }
}
