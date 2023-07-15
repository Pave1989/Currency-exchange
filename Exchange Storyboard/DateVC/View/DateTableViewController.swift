//
//  DateTableViewController.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 17.06.2023.
//
import UIKit

final class DateTableViewController: UITableViewController {
    
    var output: DateTableViewOutput?
    private let cellID = "cellID"
    private let headerID = "headerID"
    private let loadingID = "loadingID"
    private var datesArray: [String] = []
    private var datesArrayAdd: [String] = []
    private var titleDate: String = "Список дат:"
    private var month: Double = 0.0
    private var monthAgo: Double = 30.0
    private var scrollActive: Bool = false //чтобы пагинация не срабатывала n-раз
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: DateTableViewCell.self), bundle: nil), forCellReuseIdentifier: cellID)
        tableView.register(UINib(nibName: String(describing: DateHeaderTableViewCell.self), bundle: nil), forHeaderFooterViewReuseIdentifier: headerID)
        tableView.register(UINib(nibName: String(describing: LoadingTableViewCell.self), bundle: nil), forCellReuseIdentifier: loadingID)        
        
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as! DateHeaderTableViewCell
        
        header.dateTitleLabel.text = titleDate
        return header
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return datesArray.count
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == datesArray.count - 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: loadingID) as! LoadingTableViewCell
            cell.loadIndicator.startAnimating()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DateTableViewCell
            let textValue = datesArray[indexPath.row]
            cell.dateLabel.text = "\(textValue)"
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dateTap = datesArray[indexPath.row]
        output?.didTapCell(dateTap: dateTap)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        if indexPath.row == datesArray.count - 1{
            if !scrollActive {
                self.scrollActive = true
                loadMoreData()
            }
        }
        func loadMoreData(){

            month = month - monthAgo
            output?.addMonth(month: month)
            print("From VC: \(month)")
            print(datesArrayAdd)
            tableView.reloadData()
        }
    }
 }

extension DateTableViewController: DateTableViewInput {
    
    func addDates(date: [String]) {
        
        self.datesArrayAdd = date
        tableView.reloadData()
    }
    
    //MARK: - нужен метод для повторного изьятия у сервиса массива дат и добавление его к имеющемуся!
    
    func showDate(date: [String]) {

        self.datesArray = date
        self.tableView.reloadData()
    }
    
    func showError(error: String) {
        
        self.titleDate = error
    }
 }

