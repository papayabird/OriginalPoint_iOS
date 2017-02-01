//
//  OPNotiTableViewCell.swift
//  OriginalPoint
//
//  Created by papayabird on 2017/2/1.
//  Copyright © 2017年 OP. All rights reserved.
//

import UIKit

class OPNotiTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(data:OPNotiObject) {
        titleLabel.text = data.title;
        dateLabel.text = data.date;
        descriptionLabel.text = data.descriptionText;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
