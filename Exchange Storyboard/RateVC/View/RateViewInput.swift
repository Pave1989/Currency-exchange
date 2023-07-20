//
//  RateViewInput.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation

protocol RateViewInput: AnyObject {
    
    // показать во view выбранную дату
    func showDate(date: String)
    
    // показать во view курс доллара
    func showUSD(usd: String)
    
    // показать во view курс евро
    func showEUR(eur: String)
    
    // показать во вью ошибку
    func showError(error: String)
}
