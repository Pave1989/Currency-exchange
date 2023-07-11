//
//  LoadTableViewCell.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 08.07.2023.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {

    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
