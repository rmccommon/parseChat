//
//  messageCell.swift
//  parseChat
//
//  Created by Sierra Klix on 10/6/18.
//  Copyright © 2018 Ryan McCommon. All rights reserved.
//

import UIKit

class messageCell: UITableViewCell {
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
