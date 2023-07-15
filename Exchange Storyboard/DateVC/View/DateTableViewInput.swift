//
//  DateTableViewInput.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 17.06.2023.
//

import Foundation

protocol DateTableViewInput: AnyObject {
    
    // Показать во view даты
    func showDate(dates:[String])
    
    // Показать во view ошибку
    func showError(error: String)
}
