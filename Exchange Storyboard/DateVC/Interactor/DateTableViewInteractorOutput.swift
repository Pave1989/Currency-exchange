//
//  DateTableViewInteractorOutput.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 20.06.2023.
//

import Foundation

protocol DateTableViewInteractorOutput: AnyObject {

    // ошибка пустой массив с датами
    func didRecevie(error: String)
    
    // загрузка дат успешно произведена
    func didLoad(dates: [String], availableDays: Int)
}
