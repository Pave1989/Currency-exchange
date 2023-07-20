//
//  RateInteractorOutput.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation

protocol RateViewInteractorOutput: AnyObject {
    
    // ошибка пустой массив с датами
    func didRecevie(error: String)
    
    // загрузка курса доллара
    func didLoadUSD(usdResult: String)
    
    // загрузка курса евро
    func didLoadEUR(eurResult: String)
}
