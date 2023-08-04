//
//  RateViewController.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import UIKit

final class RateViewController: UIViewController {
   
    var output: RateViewOutput?
    @IBOutlet weak var dateTitleLabel: UILabel!
    @IBOutlet weak var dollarValueLabel: UILabel!
    @IBOutlet weak var euroValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        output?.viewDidLoad()
  }
}

extension RateViewController: RateViewInput {
    
    func showDate(date: String) {

            self.dateTitleLabel.text = date
    }
    
    func showUSD(usd: String) {
        
        DispatchQueue.main.async {
            
            self.dollarValueLabel.text = usd
        }            
    }
    
    func showEUR(eur: String) {
        
        DispatchQueue.main.async {
            
            self.euroValueLabel.text = eur
        }     
    }
    
    func showError(error: String) {
        
        DispatchQueue.main.async {
            
            self.dollarValueLabel.text = error
            self.euroValueLabel.text = error
        }
    } 
}
