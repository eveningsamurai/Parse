//
//  ChatCell.swift
//  CodepathParse
//
//  Created by Padmanabhan, Avinash on 4/12/17.
//  Copyright © 2017 Intuit. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {
    
    @IBOutlet weak var chatCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
