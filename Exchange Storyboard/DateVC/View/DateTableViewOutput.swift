//
//  DateTableViewOutput.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 17.06.2023.
//

import Foundation

protocol DateTableViewOutput {
    // Pагрузка данных для запуска
    func viewDidLoad()
    // Прокидывается дата в выбранной ячейке
    func didTapCell(dateTap: String)
    // Загрузка дополнительных данных в таблицу
    func fetchNext()
    // Проверка начальных данных для продолжения загрузки
    func isFirstPage() -> Bool
}
