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
    private var datesArray: [String] = [] // массив для загрузки из сервиса
    private var titleDate: String = "Список дат:"
    private var scrollActive: Bool = false //булева чтобы пагинация не срабатывала n-раз
    
    override func viewDidLoad() {
        super.viewDidLoad()
                       
        output?.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: DateTableViewCell.self), bundle: nil), forCellReuseIdentifier: cellID)
        tableView.register(UINib(nibName: String(describing: DateHeaderTableViewCell.self), bundle: nil), forHeaderFooterViewReuseIdentifier: headerID)
        tableView.register(UINib(nibName: String(describing: LoadingTableViewCell.self), bundle: nil), forCellReuseIdentifier: loadingID)
    }
// HeaderCell:
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as! DateHeaderTableViewCell
        header.dateTitleLabel.text = titleDate
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
        80
    }
// TableCell:
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
            cell.selectionStyle = .none
            
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
                output?.fetchNext()
            }
        }
    }
 }

extension DateTableViewController: DateTableViewInput {

    func showDate(dates: [String]) {

        scrollActive = false
        if (output!.isFirstPage()) {
            self.datesArray = dates
        } else {
            for item in dates {
                self.datesArray.append(item)
            }
        }
        self.tableView.reloadData()
    }
    
    func showError(error: String) {
        
        self.titleDate = error
    }
 }

